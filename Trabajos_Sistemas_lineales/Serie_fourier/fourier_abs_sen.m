clc; close all; clear all;

T=5;
ts=1e-3;
t=-4*T:ts:4*T;

%Funcion 
x=abs(3*sin(6*pi/15*t));

figure()
plot(t,x,'linewidth',2);
ylabel('s(t)'); xlabel('t');
ylim([min(x)-0.2,max(x)+0.2]); xlim([min(t),max(t)]);
grid(gca,'minor');
xlim([-5 15])

% Función de sintesis (sumatoria)
x_fs1=fssintfunction(T,0,2,t);
figure()
plot(t,x_fs1,'linewidth',2);
ylabel('s(t)'); xlabel('t');
ylim([min(real(x_fs1))-0.2,max(real(x_fs1))+0.2]); xlim([min(t),max(t)]);
grid(gca,'minor');
title('k=-1 a 1');

omega=(2*pi)/T;
s_minus1=fscoeficiente(-1)*exp(1j*omega*(-1)*t);
s_0=fscoeficiente(0)*exp(1j*omega*(0)*t);
s_1=fscoeficiente(1)*exp(1j*omega*(1)*t);

figure()
hold on
plot(t,s_0,'linewidth',1);
plot(t,s_1,'r--','linewidth',1);
% k=2;
% plot(t,fscoeficiente(k)*exp(1j*omega*(k)*t),'linewidth',1);
% plot(t,fscoeficiente(-k)*exp(1j*omega*(-k)*t),'linewidth',1);
% k=3;
% plot(t,fscoeficiente(k)*exp(1j*omega*(k)*t),'linewidth',1);
% plot(t,fscoeficiente(-k)*exp(1j*omega*(-k)*t),'linewidth',1);
% k=4;
% plot(t,fscoeficiente(k)*exp(1j*omega*(k)*t),'linewidth',1);
% plot(t,fscoeficiente(-k)*exp(1j*omega*(-k)*t),'linewidth',1);
% k=100;
% plot(t,fscoeficiente(k)*exp(1j*omega*(k)*t),'linewidth',1);
% plot(t,fscoeficiente(-k)*exp(1j*omega*(-k)*t),'linewidth',1);

hold off
legend('s_0','s_1');
ylabel('x(t)'); xlabel('t');
xlim([min(t),max(t)]);
grid(gca,'minor');
