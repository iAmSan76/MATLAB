close all; clear; clc;

%Velocidades denominadas
ts=0.01; 
t=0:ts:1;

%Funcion de pertinencia
x=(t).*cwindow(0,0.4,t)+(0.*t+0.4).*cwindow(0.4,0.6,t)+...
    (-t+1).*cwindow(0.6,1,t);

%grafica
figure("Name",'conjunto trapezoidal');
stem(t,x,'g');
ylim([-0.01 1.02]);xlim([0 1]);
grid minor
title('Funcion de pertinencia trapezoidal')