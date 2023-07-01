close all; clear all; clc;

%Alturas denominadas
A_b1 = 1.50:0.01:1.55;
A_b2 = 1.55:0.01:1.60;
A_m1 = 1.57:0.01:1.65;
A_m2 = 1.65:0.01:1.70;
A_a1 = 1.67:0.01:1.75;
A_a2 = 1.75:0.01:1.82;

%Funcion 
f_b1 = 20*A_b1-30;
f_b2 = -20*A_b2+32;
f_m1 = 12.5*A_m1-19.625;
f_m2 = -20*A_m2+34;
f_a1 = 12.5*A_a1-20.875;
f_a2 = -14.286*A_a2+26;

%Grafica de las funciones
figure("Name",'valores alturas');
hold on;
plot(A_b1,f_b1,'b',A_b2,f_b2,'b');
plot(A_m1,f_m1,'r',A_m2,f_m2,'r');
plot(A_a1,f_a1,'g',A_a2,f_a2,'g');
grid minor;
legend('bajo','','medio','','alto','');
title('Funcion de altura');
xlabel('Altura[m]');ylabel('Pertenencia');

