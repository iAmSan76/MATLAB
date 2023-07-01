clc; close all; clear all;

T=4;
ts=1e-3;
t=-4*T:ts:4*T;

x=(exp(3.*t).*cos(20.*pi.*t)).*ventana(-10,0,t);

figure()
plot(t,x,'linewidth',2);
ylabel('r(t)'); xlabel('t');
ylim([-1.1 1.1]);xlim([-2.5 0.2])
grid(gca,'minor');
