clc; close all; clear all;

T=4;
ts=1e-3;
t=-4*T:ts:4*T;

x=t.*ventana(-2,2,t);
%SOLO FUNCIONA CON MULTIPLOS DE 4 LOS TIEMPOS INICIALES Y FINALES EN ESTE
%CASO SE TOMA 16
x_T=periodizador(-16,16,t,T);

figure()
plot(t,x_T,'linewidth',2);
ylabel('x(t)'); xlabel('t');
ylim([min(x)-0.2,max(x)+0.2]); xlim([min(t),max(t)]);
grid(gca,'minor');