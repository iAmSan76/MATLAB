clc; close all; clear all;

ts=1e-3;
t=-15:ts:15;

x=(3*exp(-0.2*abs(t))).*ventana(-8,8,t);

taus=1e-3;
tau=-15:taus:15;
[rho_xx,tau_m]=xcorr(x);
figure()
plot(tau_m*taus,rho_xx*taus,'linewidth',2);
ylabel('r_{xx}(\tau)');
xlabel('\tau');
ylim([min(rho_xx*taus)-0.2,max(rho_xx*taus)+0.2]); xlim([-12,12]);
grid(gca,'minor');