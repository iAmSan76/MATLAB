close all; clear all; clc;

%Parametro de la norma S-Yeger
p = 2;

%Alturas denominadas
A_b1 = 1.50:0.01:1.55;
A_b2 = 1.55:0.01:1.60;
A_m1 = 1.57:0.01:1.65;
A_m2 = 1.65:0.01:1.70;
A_a1 = 1.67:0.01:1.75;
A_a2 = 1.75:0.01:1.80;

%Funcion 
f_b1 = 20*A_b1-30;
f_b2 = -20*A_b2+32;
f_m1 = 12.5*A_m1-19.625;
f_m2 = -20*A_m2+34;
f_a1 = 12.5*A_a1-20.875;
f_a2 = -20*A_a2+36;

%Funcion norma S-Yaeger
s1=min(1,(f_b1.^p+f_b2.^p).^(1/p));
s2=min(1,(f_m1.^p+f_m2.^p).^(1/p));



%graficas
hold on;
plot(A_b1,s1,'r',A_b2,s2,'r');



