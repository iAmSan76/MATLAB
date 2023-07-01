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


V_am=sin(2*pi*fc*t)+1/2*cos(2*pi*(fc-fm1)*t)-1/2*cos(2*pi*(fc-fm1)*t)+...
    1/2*cos(2*pi*(fc-fm2)*t)-1/2*cos(2*pi*(fc-fm2)*t);

subplot(313)
plot(t,V_am);
title('Señal Moduladora doble Banda Lateral con Portadora de Máxima Potencia')
xlabel('tiempo (ms)');
ylabel('V_(am)(t)'); grid minor;
xlim([min(t),max(t)-0.8]);