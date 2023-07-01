clear all;close all;clc

%Variables de control
Ec = 25;
Em = 15;
m = 0.6;
Vmax = Ec+Em;
Vmin = Ec-Em; 
fc=100;
fm = 10;
Ts=0.5;         %Tiempo de muestreo
t = 0:1e-3:Ts; %Tiempo



%Señal moduladora
x = Ec*sin(2*pi*fc*t)-m*(Ec/2)*cos(2*pi*(fc+fm)*t)...
    +m*(Ec/2)*cos(2*pi*(fc-fm)*t);
%Envolvente
dt=1/fc;
n = t * dt;% serie temporal
z = hilbert(x);% transformada de Hilbert
a = abs(z);% envolvente
figure("Name","Envolvente");
plot(t,x,t,a,t,(a*-1));
title('Señal Moduladora')
xlabel('tiempo (ms)');
ylabel('x(t)'); grid minor;
legend("Señal AM","Envolvente superior","Envolvente inferior");
