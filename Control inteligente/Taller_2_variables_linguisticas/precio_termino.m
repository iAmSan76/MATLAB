close all; clear; clc;

ts=1; % sampling
t1=0:ts:10000;
t2=8000:ts:18000;
t3=16000:ts:26000;

x1=(0.0002.*t1).*cwindow(0,5000,t1)+(-0.0002.*t1+2).*cwindow(5000,10000,t1);
x2=(0.0002.*t2-1.6).*cwindow(8000,13000,t2)+(-0.0002.*t2+3.6).*cwindow(13000,18000,t2);
x3=(0.0002.*t3-3.2).*cwindow(16000,21000,t3)+(-0.0002.*t3+5.2).*cwindow(21000,26000,t3);

figure()
plot(t1,x1,'linewidth',2)
hold on
plot(t2,x2,'linewidth',2)
plot(t3,x3,'linewidth',2)
grid on
xlabel('Precio');
ylabel('Pertinencia');
legend('Barato','Medio','Caro');
ylim([-0.1,1.1])
xlim([-1000,28000])
title('Funcion de pertinencia')
%%
%--------------------------- Normas s con w=1
w=1;
for i=1:1:8000
    auxs1(i)=x1(i);
    auxt1(i)=((1-x1(i))^w+(1)^w)^(1/w);
end

j=8001;
k=8000;
l=1;

for i=1:1:2001
    auxs1(j) = (x1(k)^w + x2(l)^w)^(1/w);
    auxt1(j) = ((1-x1(k))^w+(1-x2(l))^w)^(1/w);
    j=j+1;
    k=k+1;
    l=l+1;
end
m=10002;
n=2001;

for i=1:1:8000
    auxs1(m)=x2(n);
    auxt1(m)=((1)^w+(1-x2(n))^w)^(1/w);
    m=m+1;
    n=n+1;
end

for i=1:1:18001
    
    if auxs1(i) >= 1
        Ns(i) = 1;
    else
        Ns(i) = auxs1(i);
    end
    
    if auxt1(i) >= 1
        Nt1(i) = 1;
    else
        Nt1(i) = auxt1(i);
    end
end

for i=1:1:18001
    
    Nt(i)=1-Nt1(i);
    
end

xf = 0:1:18000;

figure
subplot(2,3,1)
plot(xf, Ns,'linewidth',2)
ylim([-0.1,1.1])
xlim([-1000,19000])
title('Norma S Yager (w = 1)')
xlabel('Precio')
ylabel('\mu (x)')
grid on

subplot(2,3,4)
plot(xf, Nt,'linewidth',2)
ylim([-0.1,1.1])
xlim([-1000,19000])
title('Norma T Yager (w = 1)')
xlabel('Precio')
ylabel('\mu (x)')
grid on
%%
%%--------------------------- Normas s con w=5
w=5;
for i=1:1:8000
    auxs1(i)=x1(i);
    auxt1(i)=((1-x1(i))^w+(1)^w)^(1/w);
end

j=8001;
k=8000;
l=1;

for i=1:1:2001
    auxs1(j) = (x1(k)^w + x2(l)^w)^(1/w);
    auxt1(j) = ((1-x1(k))^w+(1-x2(l))^w)^(1/w);
    j=j+1;
    k=k+1;
    l=l+1;
end
m=10002;
n=2001;

for i=1:1:8000
    auxs1(m)=x2(n);
    auxt1(m)=((1)^w+(1-x2(n))^w)^(1/w);
    m=m+1;
    n=n+1;
end

for i=1:1:18001
    
    if auxs1(i) >= 1
        Ns(i) = 1;
    else
        Ns(i) = auxs1(i);
    end
    
    if auxt1(i) >= 1
        Nt1(i) = 1;
    else
        Nt1(i) = auxt1(i);
    end
end

for i=1:1:18001
    
    Nt(i)=1-Nt1(i);
    
end

xf = 0:1:18000;

subplot(2,3,2)
plot(xf, Ns,'linewidth',2)
ylim([-0.1,1.1])
xlim([-1000,19000])
title('Norma S Yager (w = 5)')
xlabel('Precio')
ylabel('\mu (x)')
grid on

subplot(2,3,5)
plot(xf, Nt,'linewidth',2)
ylim([-0.1,1.1])
xlim([-1000,19000])
title('Norma T Yager (w = 5)')
xlabel('Precio')
ylabel('\mu (x)')
grid on
%%
%--------------------------- Normas s con w=100
w=100;
for i=1:1:8000
    auxs1(i)=x1(i);
    auxt1(i)=((1-x1(i))^w+(1)^w)^(1/w);
end

j=8001;
k=8000;
l=1;

for i=1:1:2001
    auxs1(j) = (x1(k)^w + x2(l)^w)^(1/w);
    auxt1(j) = ((1-x1(k))^w+(1-x2(l))^w)^(1/w);
    j=j+1;
    k=k+1;
    l=l+1;
end
m=10002;
n=2001;

for i=1:1:8000
    auxs1(m)=x2(n);
    auxt1(m)=((1)^w+(1-x2(n))^w)^(1/w);
    m=m+1;
    n=n+1;
end

for i=1:1:18001
    
    if auxs1(i) >= 1
        Ns(i) = 1;
    else
        Ns(i) = auxs1(i);
    end
    
    if auxt1(i) >= 1
        Nt1(i) = 1;
    else
        Nt1(i) = auxt1(i);
    end
end

for i=1:1:18001
    
    Nt(i)=1-Nt1(i);
    
end

xf = 0:1:18000;

subplot(2,3,3)
plot(xf, Ns,'linewidth',2)
ylim([-0.1,1.1])
xlim([-1000,19000])
title('Norma S Yager (w = 100)')
xlabel('Precio')
ylabel('\mu (x)')
grid on

subplot(2,3,6)
plot(xf, Nt,'linewidth',2)
ylim([-0.1,1.1])
xlim([-1000,19000])
title('Norma T Yager (w = 100)')
xlabel('Precio')
ylabel('\mu (x)')
grid on