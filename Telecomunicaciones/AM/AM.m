clear all
close all
clc
[y,Fs]=audioread('tkn.wav');

y=y(1:1000000,1);%Mensaje
[L,M]=size(y);
T = 1/Fs;
fc=1e6;
Tc=1/fc;
Ts=0.1*Tc;
fs=1/Ts;

t(:,1)=[0:Ts:(L-1)*Ts];

%mensaje m(t)
   fm=Fs; %frecuencia del mensaje
   m=100*y;
    figure(1);subplot(2,1,1);
    plot(t*(10^3),m,'k');
    title('Señal de Mensaje')
    xlabel('tiempo [ms]');ylabel('m(t)');grid on;
    
    [f,Mf]=transfourier(m,fs); %tranformada de fourier
    subplot(2,1,2)
    plot(f/1000,Mf,'k');
    xlabel('frecuecnia (Khz)');ylabel('M(f)');grid on;
    xlim([-2000 2000]);
%Portadora
Ac=1;
c=Ac*cos(2*pi*fc*t);
figure(2);subplot(2,1,1);
plot(t*(10^3),c,'k');
title('Señal Portadora')
xlabel('tiempo (ms)');
ylabel('c(t)'); grid on;
xlim([0 0.5]);

[f,Cf]=transfourier(c,fs); %trans de fourier
    subplot(2,1,2);
    plot(f/1000,Cf,'k');grid on;
    xlabel('frecuencia (Khz)');
    ylabel('C(f)');
    xlim([-20 20]);

%Modulacion AM
ka=1;
    s=(1+ka*m).*c;
    figure(3)
    subplot(2,1,1);
    plot(t*(10^3),s,'k');
    title('Señal Modulada (AM)')
    xlabel('tiempo (ms)');ylabel('s(t)');grid on
    xlim([0 5]);
    
     
    [f,Sf]=transfourier(s,fs);
    subplot(2,1,2)
    plot(f/1000,Sf,'k');
    xlabel('frecuencia (Khz)')
    ylabel('S(f)');grid on
    xlim([-2000 2000]);%xlim([-15 15]);
    %set(gca,'Xtick',-16:16);
%Canal
s1=awgn(s,10);
figure(4);
plot(t*(10^3),s1,'r');
title('Señal Modulada En El Canal')
xlim([0 20]);
%Modulador de Producto
m1=cos(2*pi*fc*t);
S2=m1.*s1;
figure(5)

plot(t*(10^3), S2,'r'); grid on;
title('Señal con modulador de produto');
xlim([0 20]);
%filtro
hpFilt = designfilt('lowpassfir','StopbandFrequency',0.3, ...
         'PassbandFrequency',0.25,'PassbandRipple',0.5, ...
         'StopbandAttenuation',90,'DesignMethod','kaiserwin');
fvtool(hpFilt)
dataOut=filter(hpFilt,S2);
figure(7);
subplot(3,1,1);
plot(t,m,'k');xlabel('tiempo [ms]');ylabel('m(t)');grid on;subplot(3,1,2);
plot(t*(10^3),s,'k');xlabel('tiempo (ms)');ylabel('s(t)');grid on
subplot(3,1,3);
plot(t*(10^3),dataOut); grid on;
title('Señal Filtrada(Demodulada)')
%xlim([0 20]);
sound(dataOut,Fs)

