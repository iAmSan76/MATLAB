close all; clear all; clc;

%Alturas denominadas
v_b1 = 1:0.01:2;
v_b2 = 2:0.01:4;
v_m1 = 4:0.01:6;
v_m2 = 6:0.01:8;
v_a1 = 8:0.01:10;
v_a2 = 10:0.01:12;

%Funcion 
f_b1 = v_b1-1;
f_b2 = -0.5*v_b2+2;
f_m1 = 0.5*v_m1-2;
f_m2 = -0.5*v_m2+4;
f_a1 = 0.5*v_a1-4;
f_a2 = -0.5*v_a2+6;

%Grafica de las funciones
figure("Name",'Valores de velocidades');
hold on;
plot(v_b1,f_b1,'b',v_b2,f_b2,'b');
plot(v_m1,f_m1,'r',v_m2,f_m2,'r');
plot(v_a1,f_a1,'g',v_a2,f_a2,'g');
grid minor;
legend('lento','','agil','','bolido','');
title('Funcion de velocidad');
xlabel('Velocidad [m/s]');ylabel('Pertenencia');

