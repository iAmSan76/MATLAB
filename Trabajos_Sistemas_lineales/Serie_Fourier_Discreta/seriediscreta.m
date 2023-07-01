clc; close all; clear all;

N=10;
n=-10*N:10*N;

%Se escribe la funcion discreta
x=1.*ventana(0,4,n);
x_N=zeros(1,length(n));
n_i=-30;
n_f=30;
%definimos el periodo
omega=pi/5;

for nx=n_i:N:n_f 
    x_N=x_N+(1.*ventana(nx,(nx+5),n));  
end

%graficamos la funcion periodica x_n
figure()
subplot(211)
stem(n,x_N,'linewidth',1.2)
ylabel('x(n)'); xlabel('n');
ylim([min(x_N)-0.2,max(x_N)+0.5]); 
xlim([-21 19]);
grid(gca,'minor');

x_fs=zeros(1,length(n));

k_i = 0;
k_f = N-1;
%hallamos c_k
for k=k_i:k_f
    if k == 0
        c_k = 1/2;
    else
        c_k = ((1-(-1).^k)/(1-exp(-1j*(pi/5)*k)))*(1/10);
    end
    x_fs=x_fs+c_k*exp(1j*omega*k*n);
end
%graficamos la funcion x_fs
subplot(212)
stem(n,x_fs,'b','linewidth',1.2)
ylim([0,1.5]); 
xlim([-25,18]);
grid(gca,'minor');
title('k = 0 a N-1');

