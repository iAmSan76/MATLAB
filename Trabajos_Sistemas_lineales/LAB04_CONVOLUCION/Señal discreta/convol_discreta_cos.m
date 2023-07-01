clear all; close all; clc;

%Senal entrada
n = 0:10;
x_n = cos(pi*n/2);

%Respuesta al impulso
h_n = [1,1,1,1,1,-1,-1,-1,-1,-1];

%convolucion del sistema
y_n = conv(x_n,h_n);

%Graficas
figure()
stem(x_n,'filled')
ylim([-1.5 1.5])
xlabel('n');ylabel('x[n]');grid('minor')
figure()
stem(h_n,'filled','r')
ylim([-1.5 1.5])
xlabel('n');ylabel('h[n]');grid('minor')
figure()
stem(y_n,'filled','b')
ylim([-2.1 1.5])
xlabel('n');ylabel('y[n]');grid('minor')