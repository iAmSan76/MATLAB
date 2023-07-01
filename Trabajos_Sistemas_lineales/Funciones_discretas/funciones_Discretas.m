%----------------------------sign------------------------------------------
%t = -5:0.5:5; %vector de tiempo
%y =sign(t);
%ylim([-2,2]);
%stem(t,y);
%grid on;
%title('grafica de la funcion sign(x)');
%xlabel('t [s]');
%ylabel('sign(t)');
%----------------------------sawtooth--------------------------------------
%T = 5*(1/50);  %periodo de la funcion [S]
%fs = 800;  %frecuencia de muestreo [Hz]
%t = 0:1/fs:T-1/fs; %Vector del tiempo
%x = sawtooth(2*pi*50*t); 
%stem(t,x);
%ylim([-2,2]);
%grid on;
%title('grafica funcion sawtooht.');
%xlabel('t[s]');
%ylabel('sawtooth(t)');
%----------------------------rectpuls--------------------------------------
%x = -5:1:5; %vector de tiempo
%y = rectpuls(x);
%stem(x,y);
%ylim([-2,2]);
%grid on;
%title('grafica de la funcion rectpuls');
%xlabel('t [s]');
%ylabel('rectpuls(t)');
%----------------------------tripuls--------------------------------------
%fs=10; %frecuencia de muestreo
%x = -3:1/fs:3; %vector de tiempo
%y = tripuls(x);
%stem(x,y);
%ylim([-1.5,1.5]);
%grid on;
%title('grafica de la funcion tripuls');
%xlabel('t [s]');
%ylabel('tripuls(t)');
%----------------------------gausspuls-------------------------------------
%fs=9; %frecuencia de muestreo
%t = -4:1/fs:4; %vector de tiempo
%y = gauspuls(t,1/fs,0.6);
%stem(t,y);
%grid on;
%title('grafica de la funcion gausspuls');
%xlabel('t [s]');
%ylabel('gauspuls(t)');
%----------------------------pulstran--------------------------------------
t = 0:0.5:60; %vector de tiempo
d = [0:2:60;sin(2*pi*0.05*(0:2:60))]';  %forma de onda
y = pulstran(t,d,"tripuls");
ylim([-2,2]);
stem(t,y)
grid on;
title('grafica de la funcion pulstran');
xlabel('t [s]');
ylabel('gauspulstran(t,d,func)');