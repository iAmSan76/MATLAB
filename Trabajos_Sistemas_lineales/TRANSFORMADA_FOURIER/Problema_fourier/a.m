clc; close all; clear;

ts=1e-3;
t=-6:ts:6;

x=zeros(1,length(t))+ventanacerradader(-2,-1,t)+2.*ventanacerradader(-1,1,t)...
    +ventana(1,2,t);

figure()
plot(t,x,'linewidth',2);
ylabel('x(t)'); xlabel('t');ylim([-0.1 2.1])
grid(gca,'minor');
