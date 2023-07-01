clear all; close all; clc;

n = -50:50;
n_2 = -100:100;
%Funcion de escalon unitario
esc_unitario = ventana(0,50,n);

%Funcion de entrada
x_n = esc_unitario;
%Respuesta del impulso
h_n = (0.6.^n).*esc_unitario;
%Convolucion entre x[n] y h[n]

y_n = conv(x_n,h_n);
%representacion grafica
figure()
stem(n,x_n,'filled')
xlabel('n');ylabel('x[n]');grid('minor')
ylim([-0.1 1.2])
figure()
stem(n,h_n,'filled','r')
xlabel('n');ylabel('h[n]');grid('minor')
ylim([-0.1 1.2])
figure()
stem(n_2,y_n,'filled','b')
xlabel('n');ylabel('y[n]');grid('minor')
xlim([-10 70])
