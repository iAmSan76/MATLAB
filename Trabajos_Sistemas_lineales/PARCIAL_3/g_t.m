clc; close all; clear all;

T=4;
ts=1e-3;
t=-4*T:ts:4*T;

x=((1/2*i*exp((2+2*i)-(1+i).*t))-(1/2*i*exp((2-2*i)-(1-i).*t))).*ventana(0,10,t);
figure()
plot(t,x,'linewidth',2);
ylabel('G(t)'); xlabel('t');
ylim([-7 0.8]);xlim([-0.1 6])
grid(gca,'minor');
