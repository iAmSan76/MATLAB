clear all; close all; clc;

% vector tiempo
n_i=-12; n_f=12;
n=n_i:n_f;

% señal arbitraria
x_n=zeros(1,length(n))+(n+1).*ventana(0,3,n);

figure()
subplot(311)
stem(n,x_n,'linewidth',3);
set(gca,'yscal','log')
grid on; xlabel('n'); ylabel('x[n]');
%ylim([min(x_n)-0.05, max(x_n)+0.05]);
xlim([-3 8]);

% vector de diferencia de tiempo
l_i=-12; l_f=12;
l=l_i:l_f;

r_xx=zeros(1,length(l))+...
    ((-l.^3)/6+61*l/6+30).*ventana(-3,0,l)+...
    (l.^3/6-61*l/6+30).*ventana(1,3,l);

subplot(312)
stem(l,r_xx,'linewidth',3);
grid on; xlabel('l'); ylabel('r_{xx}[l]');
ylim([-0.1,35]);
xlim([-8 8]);


[rho_xx,l_m]=xcorr(x_n);

subplot(313)
stem(l_m,rho_xx,'linewidth',3);
grid on; xlabel('l'); ylabel('r_{xx}[l]');
ylim([-0.1,35]);
xlim([-8 8]);