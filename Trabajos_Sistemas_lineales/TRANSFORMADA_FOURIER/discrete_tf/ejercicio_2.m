clc; close all; clear all;

n=-20:0.1:20;
x=((1/4).^n).*ventana(0,1,n);

figure()
stem(n,x,"filled","LineWidth",2);
ylim([-0.1 1.1]);xlim([-0.5 1.5]);
xlabel('n'), legend('x[n]');
grid minor

fs=1e-3;
Om=-2*pi*3:pi*fs:2*pi*3;
X=4./(sqrt(17-8*cos(Om)));

figure()
plot(Om,X,'linewidth',2);
%xlim([-2*pi 2*pi]); ylim([min(X)-0.3 max(X)+0.3]);
xlabel('\Omega'), legend('X(\Omega)');
grid minor

L=length(x);
n = 2^nextpow2(L);
X_m=fft(x,n);

figure()
plot(abs(X_m),'linewidth',2);
xlabel('\Omega'), legend('X(\Omega)');
grid minor
xlim([-2*pi 2*pi]); ylim([min(X)-0.3 max(X)+0.3]);