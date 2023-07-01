clear all;close all;clc

%Variables de control
fm = 25;         %Freuencia moduladora
fm1=25;          %Inferior
fm2=70;          %Superior
fc = 50;         %Frecuencia Portadora
Am = 1;          %Amplitud moduladora
Ac = 1;          %Amplitud Portadora
Fs=10e3;         %Frecuencia de muestreo
Ts=1/Fs;         %Tiempo de muestreo
t = (0:1e-3:1/Ts-1)/Fs; %Tiempo
Frec=0:Fs/2-1;  %Frecuencia del espectro

% %Señal doble banda lateral
% V_am=sin(2*pi*fc*t)+1/2*cos(2*pi*(fc-fm1)*t)-1/2*cos(2*pi*(fc-fm1)*t)+...
%     1/2*cos(2*pi*(fc-fm2)*t)-1/2*cos(2*pi*(fc-fm2)*t);
% figure("Name",'Señal doble banda lateral')
% plot(t,V_am);
% title('Señal doble Banda Lateral con Portadora de Máxima Potencia')
% xlabel('tiempo (ms)');
% ylabel('V_(am)(t)'); grid minor;
% xlim([min(t),max(t)-0.8]);

%Señal moduladora
x = Am*sin(2*pi*fm*t);
figure("Name",'Pasos de la señal')
subplot(221)
plot(t,x);
title('Señal Moduladora')
xlabel('tiempo (ms)');
ylabel('x(t)'); grid minor;
xlim([min(t),max(t)-0.8]);ylim([-Am-0.1 Am+0.1]);

%Señal portadora
c=Ac*cos(2*pi*fc*t);
subplot(222)
plot(t,c);
title('Señal Portadora')
xlabel('tiempo (ms)');
ylabel('c(t)'); grid minor;
xlim([min(t),max(t)-0.8]);ylim([-Ac-0.1 Ac+0.1]);

% %Salida de la señal
% V_sal=x+c;
% subplot(223)
% plot(t,V_sal);
% title('Salida Modulada')
% xlabel('tiempo (ms)');
% ylabel('V_s(t)'); grid minor;
% xlim([min(t),max(t)-0.8]);ylim([-Ac-Am-0.1 Ac+Am+0.1]);
% 
% %Espectro de la señal
% Y=fft(V_sal);
% % Yabs=abs(YL)/length(V_sal);
% % Yfin=fftshift(Yabs);
% % Eje_frec = (length(Yfin)/2)+1;
% subplot(224)
% stem(Frec,length(abs(Y)));
% title('Espectro de Frecuencias')
% xlabel('Frecuencia (Hz)');
% ylabel('Y(t)'); grid minor;
% xlim([min(t),max(t)-0.8]);




