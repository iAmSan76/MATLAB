clc; close all; clear all;

% Periodo
T=12;

% Vector de tiempo
ti=-3*T; tf=3*T; ts=1e-3;
t=ti:ts:tf;

x=(2*t+8).*ventanacerradader(-4,-2,t)+(t.^2).*ventanacerradader(-2,2,t)+...
   (-2*t+8).*ventanacerradader(2,4,t) ;



Nk=100;
x_fs=fs_function(Nk,T,t);
    
figure()
subplot(321)
plot(t,x,'linewidth',2);
grid minor
xlabel('t'); ylabel('x(t)');
xlim([-8,8]); ylim([min(x)-0.3,max(x)+0.3]);

subplot(322)
Nk=2;
x_fs=fs_function(Nk,T,t);
plot(t,x_fs,'linewidth',2);
grid minor
xlabel('t'); ylabel('x(t)'); title("k="+num2str(Nk))
xlim([-18,18]); ylim([min(x_fs)-0.3,max(x_fs)+0.3]);

subplot(323)
Nk=10;
x_fs=fs_function(Nk,T,t);
plot(t,x_fs,'linewidth',2);
grid minor
xlabel('t'); ylabel('x(t)'); title("k="+num2str(Nk))
xlim([-18,18]); ylim([min(x_fs)-0.3,max(x_fs)+0.3]);

subplot(324)
Nk=100;
x_fs=fs_function(Nk,T,t);
plot(t,x_fs,'linewidth',2);
grid minor
xlabel('t'); ylabel('x(t)'); title("k="+num2str(Nk))
xlim([-18,18]); ylim([min(x_fs)-0.3,max(x_fs)+0.3]);

subplot(3,2,[5 6])
indexk=0:1:100;
a_k=zeros(1,length(indexk));
a_k(1)=1;
for k=1:100
    a_k(k+1)=akcoeftrig(k);
end
stem(indexk,a_k,'filled');
grid minor
xlabel('k'); ylabel('a_k');
xlim([-0.5,30.5]);ylim([-1.3 1.1])

