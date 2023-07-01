close all; clear; clc;

%Valores de corte
ts=0.01; 
t=0:ts:1;

%Funcion de pertinencia
x1=(t).*cwindow(0,0.4,t)+(0.*t+0.4).*cwindow(0.4,0.6,t)+...
    (-t+1).*cwindow(0.6,1,t);

%Funcion de pertinencia
x2=(t).*cwindow(0,0.5,t)+(-t+1).*cwindow(0.5,1,t);

%grafica trapezoidal
figure("Name",'conjuntos');
subplot(211);
stem(t,x1,'r');
ylim([-0.01 1.02]);xlim([0 1]);
grid minor
title('Funcion de pertinencia triangular')
%grafica triangular
subplot(212);
stem(t,x2,'g');
ylim([-0.01 1.02]);xlim([0 1]);
grid minor
title('Funcion de pertinencia trapezoidal')

