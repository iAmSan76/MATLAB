clc; close all; clear;

ts=1e-3;
t=-6:ts:6;
s=3*(cos(60*pi*t)).^2;

figure()
%subplot(3,1,1)
plot(t,s,'linewidth',2);
ylabel('s(t)'); xlabel('t');
ylim([min(s)-0.2,max(s)+0.2]); xlim([-1/40 1/40]);
grid(gca,'minor');

ws=1e-3;
w=-20:ws:20;
S=(((-9.*i.*exp(-i.*w/30)).*(-1+exp(i.*w/30)).*(w.^2-(4800.*pi.^2)))/(2.*w.^3-(28800.*pi.^2.*w)));
%S(find(w==0))=12;

figure()
subplot(3,1,2)
plot(S,'linewidth',2);
ylabel('S(\omega)'); xlabel('\omega');
%ylim([0,9]); xlim([min(w),max(w)]);
grid(gca,'minor');

fs=1/ts;
[f_m,S_m]=spectrumGen(s,fs,2);
figure()
%subplot(3,1,3)
plot(f_m*(4*pi),S_m,'linewidth',2);
ylabel('S(f)'); xlabel('f');
ylim([0,max(S_m)+0.2]); xlim([-20,20]);
grid(gca,'minor');