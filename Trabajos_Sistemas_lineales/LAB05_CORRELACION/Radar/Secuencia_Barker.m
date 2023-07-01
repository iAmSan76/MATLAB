clear all; close all; clc;

%Variables
Fs = 16e6;%Frecuencia de muestreo
tao=0.1e-3;%Tao
t_s = 1/Fs;%Tiempo secuencia

b_4=4;%cantidad de bits 4
b_11=11;%cantidad de bits 11
t_b_4 = tao/b_4;%Tiempo de 4 bits 
t_b_11 = tao/b_11;%Tiempo de 11 bits
t_1 = 0:t_s:tao-t_s;%vector de tiempo 1
t_2 = 0:t_s:tao-6*t_s;%vector de tiempo 2

%Redondeo al entero mas cercano (Numero de muestras)
N_4=round(t_b_4/t_s);
N_11=round(t_b_11/t_s);

%Secuencia de Barker 4 bits [1,1,1,-1]
s_4=[(1*ones(1,N_4)),(1*ones(1,N_4)),(1*ones(1,N_4)),(-1*ones(1,N_4))];

%Secuencia de Barker 11 bits [1,1,1,-1,-1,-1,1,-1,-1,1-1]
s_11=[(1*ones(1,N_11)),(1*ones(1,N_11)),(1*ones(1,N_11)),(-1*ones(1,N_11)),...
      (-1*ones(1,N_11)),(-1*ones(1,N_11)),(1*ones(1,N_11)),(-1*ones(1,N_11)),...
      (-1*ones(1,N_11)),(1*ones(1,N_11)),(-1*ones(1,N_11))];

%Representacion grafica Secuencia de barker 11 bits
figure()
subplot(211)
plot(t_1,s_4);
ylim([-1.2 1.2]);grid("minor");
title("Secuencia de barker 4 bits")
%Representacion grafica Secuencia de barker 11 bits
subplot(212)
plot(t_2,s_11);
ylim([-1.2 1.2]);grid("minor");
title("Secuencia de barker 11 bits")

%-------------------------------------------------------
%Autocorrelación 
%Se hace la autocorrelacion de la secuencia s_4
[phi_x,mlag]=xcorr(s_4);
%Se hace la autocorrelacion de la secuencia s_11
[phi_x1,mlag1]=xcorr(s_11);
figure()
%Representacion grafica de la autocorrelacion de la secuencia de barker 4 bits
subplot(211);
plot(mlag*(1e-3),phi_x*(1e-3));
xlim([-1.5 1.5]);grid("minor");
title("Autocorrelación secuencia de 4 bits")
%Representacion grafica de la autocorrelacion de la Secuencia de barker 11 bits
subplot(212);
plot(mlag1*(1e-3),phi_x1*(1e-3));
xlim([-1.5 1.5]);grid("minor");
title("Autocorrelación secuencia de 11 bits")
%-----------------------------------------------------
%Correlacion cruzadada

d_w=10;
d_bits=256;
secuencia_4=[1 1 1 -1];
secuencia_11=[1 1 1 1 -1 -1 1 -1 -1 1 -1];
ss_4=flip(secuencia_4);
ss_11=flip(secuencia_11);
tx=[secuencia_4 rand(1,d_w)];
tx2=[secuencia_11 rand(1,d_w)];

for i =2:d_w
    tx = [tx secuencia_4 rand(1,d_bits)];
end

for i =2:d_w
    tx2 = [tx2 secuencia_11 rand(1,d_bits)];
end
auxi = tx;
auxi2 = tx2;
[ phi_x, mlag ]=xcorr(s_4,auxi);
[ phi_x1, mlag1 ]=xcorr(s_11,auxi2);
figure()
subplot(211)
plot(mlag,phi_x)
xlim([-2e3 2e3]);grid("minor");
title("correlación cruzada con secuencia de 4 bits aleatoria")
subplot(212)
plot(mlag1,phi_x1)
xlim([-2e3 2e3]);grid("minor");
title("correlación cruzada con secuencia de 11 bits aleatoria")
%----------------------------------------------
%Ruido con -10dB, -3dB, 0dB y 3dB

%Ruido para la secuencia de 4 bits
ruido4_10dB=awgn(s_4,-10);
ruido4_3dB=awgn(s_4,-3);
ruido4_0dB=awgn(s_4,0);
ruido4_3dB_pos=awgn(s_4,3);

%representación grafica para el ruido con la secuencia de 4 bits
figure()
subplot(411)
plot(t_1,ruido4_10dB);
title("Ruido con -10dB")
subplot(412)
plot(t_1,ruido4_3dB);
title("Ruido con -3dB")
subplot(413)
plot(t_1,ruido4_0dB);
title("Ruido con 0dB")
subplot(414)
plot(t_1,ruido4_3dB_pos);
title("Ruido con 3dB")

%Ruido para la secuencia de 11 bits
ruido11_10dB=awgn(s_11,-10);
ruido11_3dB=awgn(s_11,-3);
ruido11_0dB=awgn(s_11,0);
ruido11_3dB_pos=awgn(s_11,3);

%representación grafica para el ruido con la secuencia de 11 bits
figure()
subplot(411)
plot(t_2,ruido11_10dB);
title("Ruido con -10dB")
subplot(412)
plot(t_2,ruido11_3dB);
title("Ruido con -3dB")
subplot(413)
plot(t_2,ruido11_0dB);
title("Ruido con 0dB")
subplot(414)
plot(t_2,ruido11_3dB_pos);
title("Ruido con 3dB")
%-------------------------------------------------------------
%Correlacion con la funcion de ruido

%correlacion para la secuencia de 4 bits y sus ruidos
[phi_x1,mlag1]=xcorr(s_4,ruido4_10dB);
[phi_x2,mlag2]=xcorr(s_4,ruido4_3dB);
[phi_x3,mlag3]=xcorr(s_4,ruido4_0dB);
[phi_x4,mlag4]=xcorr(s_4,ruido4_3dB_pos);

%Representación grafica de las correlaciones con 4 bits
figure()
subplot(411)
plot(mlag1,phi_x1);
xlim([-1.5e3 1.5e3]);grid("minor");
title("correlación con Ruido de -10dB")
subplot(412)
plot(mlag2,phi_x2);
xlim([-1.5e3 1.5e3]);grid("minor");
title("correlación con Ruido de -3dB")
subplot(413)
plot(mlag3,phi_x3);
xlim([-1.5e3 1.5e3]);grid("minor");
title("correlación con Ruido de 0dB")
subplot(414)
plot(mlag4,phi_x4);
xlim([-1.5e3 1.5e3]);grid("minor");
title("correlación con Ruido de 3dB")

%correlacion para la secuencia de 11 bits y sus ruidos
[phi_x1,mlag1]=xcorr(s_11,ruido4_10dB);
[phi_x2,mlag2]=xcorr(s_11,ruido4_3dB);
[phi_x3,mlag3]=xcorr(s_11,ruido4_0dB);
[phi_x4,mlag4]=xcorr(s_11,ruido4_3dB_pos);

%Representación grafica de las correlaciones con 11 bits
figure()
subplot(411)
plot(mlag1,phi_x1);
xlim([-1.5e3 1.5e3]);grid("minor");
title("correlación con Ruido de -10dB")
subplot(412)
plot(mlag2,phi_x2);
xlim([-1.5e3 1.5e3]);grid("minor");
title("correlación con Ruido de -3dB")
subplot(413)
plot(mlag3,phi_x3);
xlim([-1.5e3 1.5e3]);grid("minor");
title("correlación con Ruido de 0dB")
subplot(414)
plot(mlag4,phi_x4);
xlim([-1.5e3 1.5e3]);grid("minor");
title("correlación con Ruido de 3dB")





