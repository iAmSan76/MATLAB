clear all; close all; clc;

% vector tiempo
n_i=-12; n_f=12;
n=n_i:n_f;

% señal arbitraria
x_n=zeros(1,length(n))+exp(3*n).*ventana(0,5,n);
y_n=zeros(1,length(n))+exp(3*n-21).*ventana(7,12,n);

figure()
subplot(311)
stem(n,x_n,'linewidth',3);
hold on;
stem(n,y_n,'linewidth',3);
hold on;
set(gca,'yscal','log')
grid on; xlabel('n'); ylabel('x[n]');
%ylim([min(x_n)-0.05, max(x_n)+0.05]);
xlim([-3 13]);

% vector de diferencia de tiempo
l_i=-12; l_f=12;
l=l_i:l_f;

r_xy=zeros(1,length(l))+...
    ((exp(-3*l-21)).*(1-exp(6*l+78))/(1-exp(6))).*ventana(-12,-7,l)+...
    ((exp(-3*l-21)).*(exp(6*l+42)-exp(36))/(1-exp(6))).*ventana(-6,-2,l);

subplot(312)
stem(l,r_xy,'linewidth',3);
set(gca,'yscal','log')
grid on; xlabel('l'); ylabel('r_{xy}[l]');
ylim([1e0, 1e15]);
xlim([-13 -1]);


[rho_xy,l_m]=xcorr(x_n,y_n);

subplot(313)
stem(l_m,rho_xy,'linewidth',3);
set(gca,'yscal','log')
grid on; xlabel('l'); ylabel('r_{xy}[l]');
ylim([1e0, 1e15]);
xlim([-13 -1]);
