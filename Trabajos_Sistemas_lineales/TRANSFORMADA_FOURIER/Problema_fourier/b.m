clc; close all; clear;

ts=1e-3;
t=-6:ts:6;
fc=2e9;

x=zeros(1,length(t))+ventanacerradader(-2,-1,t)+2.*ventanacerradader(-1,1,t)...
    +ventana(1,2,t);

figure()
subplot(3,1,1)
plot(t,x,'linewidth',2);
ylabel('x(t)'); xlabel('t');
ylim([min(x)-0.2,max(x)+0.2]); xlim([min(t),max(t)]);
grid(gca,'minor');

ws=1e-3;
w=-20:ws:20;
X=(2.*sin(2.*w)+2.*sin(w))./w;
X(find(w==0))=6;

figure()
%subplot(3,1,2)
plot(w,abs(X),'linewidth',2);
ylabel('X(\omega)'); xlabel('\omega');
ylim([-0.5 6.1]);
grid(gca,'minor');

