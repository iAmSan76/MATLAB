close all; clear; clc;

%Velocidades denominadas
ts=1; 
%0 a 20 - 20 a 40
t1=0:ts:40;
%30 a 50 - 50 a 80
t2=30:ts:70;
%60 a 80 - 80 a 100
t3=60:ts:100;

%Funcion de pertinencia
x1=(0.05.*t1).*cwindow(0,20,t1)+(-0.05.*t1+2).*cwindow(20,40,t1);
x2=(0.05.*t2-1.5).*cwindow(30,50,t2)+(-0.05.*t2+3.5).*cwindow(50,70,t2);
x3=(0.05.*t3-3).*cwindow(60,80,t3)+(-0.05.*t3+5).*cwindow(80,100,t3);

%grafica
figure("Name",'valores velocidades');
plot(t1,x1,t2,x2,t3,x3,'g');
ylim([-0.01 1.02]);xlim([0 101]);
grid minor
xlabel('Velocidad [Km/h]');
ylabel('Pertinencia');
legend('Lento','Rapido','Bolido');
title('Funcion de pertinencia de velocidad')

%Yager S-T---------------------------------------------
w=1;
for i=1:1:30
    s1(i)=x1(i);
    tt1(i)=((1-x1(i))^w+(1)^w)^(1/w);
end

j=31;
k=30;
l=1;

for i=1:1:10
    s1(j) = (x1(k)^w + x2(l)^w)^(1/w);
    tt1(j) = ((1-x1(k))^w+(1-x2(l))^w)^(1/w);
    j=j+1;
    k=k+1;
    l=l+1;
end
m=41;
n=10;

for i=1:1:30
    s1(m)=x2(n);
    tt1(m)=((1)^w+(1-x2(n))^w)^(1/w);
    m=m+1;
    n=n+1;
end

for i=1:1:70
    
    if s1(i) >= 1
        Ns(i) = 1;
    else
        Ns(i) = s1(i);
    end
    
    if tt1(i) >= 1
        Nt1(i) = 1;
    else
        Nt1(i) = tt1(i);
    end
end

for i=1:1:70
    
    Nt(i)=1-Nt1(i);
    
end

xf = 0:1:69;
%Grafica del S yager
figure("Name",'Normas S-T yager')
subplot(231)
plot(xf, Ns)
title('Norma S Yager (p = 1)')
xlabel('Velocidad [Km/h]')
ylabel('\mu (x)')
xlim([0 71]);
grid minor
%Grafica del T yager
subplot(234)
plot(xf, Nt)
title('Norma T Yager (p = 1)')
xlabel('Velocidad [Km/h]')
ylabel('\mu (x)')
grid minor
%--------------------------------------------
w=5;
for i=1:1:30
    s1(i)=x1(i);
    tt1(i)=((1-x1(i))^w+(1)^w)^(1/w);
end

j=31;
k=30;
l=1;

for i=1:1:10
    s1(j) = (x1(k)^w + x2(l)^w)^(1/w);
    tt1(j) = ((1-x1(k))^w+(1-x2(l))^w)^(1/w);
    j=j+1;
    k=k+1;
    l=l+1;
end
m=41;
n=10;

for i=1:1:30
    s1(m)=x2(n);
    tt1(m)=((1)^w+(1-x2(n))^w)^(1/w);
    m=m+1;
    n=n+1;
end

for i=1:1:70
    
    if s1(i) >= 1
        Ns(i) = 1;
    else
        Ns(i) = s1(i);
    end
    
    if tt1(i) >= 1
        Nt1(i) = 1;
    else
        Nt1(i) = tt1(i);
    end
end

for i=1:1:70
    
    Nt(i)=1-Nt1(i);
    
end

xf = 0:1:69;
%Grafica del S yager
subplot(232)
plot(xf, Ns)
title('Norma S Yager (p = 5)')
xlabel('Velocidad [Km/h]')
ylabel('\mu (x)')
xlim([0 71]);
grid minor
%Grafica del T yager
subplot(235)
plot(xf, Nt)
title('Norma T Yager (p = 5)')
xlabel('Velocidad [Km/h]')
ylabel('\mu (x)')
ylim([-0.1 0.21])
grid minor
%--------------------------------------------
w=100;
for i=1:1:30
    s1(i)=x1(i);
    tt1(i)=((1-x1(i))^w+(1)^w)^(1/w);
end

j=31;
k=30;
l=1;

for i=1:1:10
    s1(j) = (x1(k)^w + x2(l)^w)^(1/w);
    tt1(j) = ((1-x1(k))^w+(1-x2(l))^w)^(1/w);
    j=j+1;
    k=k+1;
    l=l+1;
end
m=41;
n=10;

for i=1:1:30
    s1(m)=x2(n);
    tt1(m)=((1)^w+(1-x2(n))^w)^(1/w);
    m=m+1;
    n=n+1;
end

for i=1:1:70
    
    if s1(i) >= 1
        Ns(i) = 1;
    else
        Ns(i) = s1(i);
    end
    
    if tt1(i) >= 1
        Nt1(i) = 1;
    else
        Nt1(i) = tt1(i);
    end
end

for i=1:1:70
    
    Nt(i)=1-Nt1(i);
    
end

xf = 0:1:69;
%Grafica del S yager
subplot(233)
plot(xf, Ns)
title('Norma S Yager (p = 100)')
xlabel('Velocidad [Km/h]')
ylabel('\mu (x)')
xlim([0 71]);
grid minor
%Grafica del T yager
subplot(236)
plot(xf, Nt)
title('Norma T Yager (p = 100)')
xlabel('Velocidad [Km/h]')
ylabel('\mu (x)')
ylim([-0.1 0.26])
grid minor

%-------Maximo----------------
w=10000;
for i=1:1:30
    s1(i)=x1(i);
    tt1(i)=((1-x1(i))^w+(1)^w)^(1/w);
end

j=31;
k=30;
l=1;

for i=1:1:10
    s1(j) = (x1(k)^w + x2(l)^w)^(1/w);
    tt1(j) = ((1-x1(k))^w+(1-x2(l))^w)^(1/w);
    j=j+1;
    k=k+1;
    l=l+1;
end
m=41;
n=10;

for i=1:1:30
    s1(m)=x2(n);
    tt1(m)=((1)^w+(1-x2(n))^w)^(1/w);
    m=m+1;
    n=n+1;
end

for i=1:1:70
    
    if s1(i) >= 1
        Ns(i) = 1;
    else
        Ns(i) = s1(i);
    end
    
    if tt1(i) >= 1
        Nt1(i) = 1;
    else
        Nt1(i) = tt1(i);
    end
end

for i=1:1:70
    
    Nt(i)=1-Nt1(i);
    
end

xf = 0:1:69;
figure("Name",'Maximo')
plot(xf, Ns)
title('Maximo')
xlabel('Velocidad [Km/h]')
ylabel('\mu (x)')
xlim([0 71]);ylim([0 1.1])
grid minor






