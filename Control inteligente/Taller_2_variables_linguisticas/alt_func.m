 close all; clear all; clc;

%Alturas denominadas
ts=0.01; 
t1=150:ts:160;%bajo
t2=156:ts:170;%medio
t3=166:ts:182;%alto

%Funcion a trozos
x1=(0.2.*t1-30).*cwindow(150,155,t1)+(-0.2.*t1+32).*cwindow(155,160,t1);
x2=(0.111.*t2-17.333).*cwindow(156,165,t2)+(-0.2.*t2+34).*cwindow(165,170,t2);
x3=(0.111.*t3-18.444).*cwindow(166,175,t3)+(-0.143.*t3+26).*cwindow(175,182,t3);

%grafica
figure("Name",'valores alturas');
plot(t1,x1,t2,x2,t3,x3,'g');
ylim([-0.01 1.02]);xlim([149 183]);
grid minor
xlabel('Altura [cm]');
ylabel('Pertinencia');
legend('Bajo','Medio','Alto');
title('Funcion de pertinencia de altura')

%yager
w=1;

for i=150:1:156
    auxs1(i)=x1(i);
    auxt1(i)=((1-x1(i))^w+(1)^w)^(1/w);
end

j=157;
k=156;
l=1;

for i=1:1:5
    auxs1(j) = (x1(k)^w + x2(l)^w)^(1/w);
    auxt1(j) = ((1-x1(k))^w+(1-x2(l))^w)^(1/w);
    j=j+1;
    k=k+1;
    l=l+1;
end
m=161;
n=5;

for i=1:1:170
    auxs1(m)=x2(n);
    auxt1(m)=((1)^w+(1-x2(n))^w)^(1/w);
    m=m+1;
    n=n+1;
end

for i=1:1:170
    
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

for i=1:1:170
    
    Nt(i)=1-Nt1(i);
    
end

xf = 1:1:170;
figure
subplot(2,3,1)
plot(xf, Ns)
title('Norma S Yager (w = 1)')
xlabel('Altura [cm]')
ylabel('\mu (x)')
grid on

subplot(2,3,4)
plot(xf, Nt)
title('Norma T Yager (w = 1)')
xlabel('Altura [cm]')
ylabel('\mu (x)')
grid on
%--------------------------
%--------------------------
w=5;


for i=150:1:156
    auxs1(i)=x1(i);
    auxt1(i)=((1-x1(i))^w+(1)^w)^(1/w);
end

j=157;
k=156;
l=1;

for i=1:1:5
    auxs1(j) = (x1(k)^w + x2(l)^w)^(1/w);
    auxt1(j) = ((1-x1(k))^w+(1-x2(l))^w)^(1/w);
    j=j+1;
    k=k+1;
    l=l+1;
end
m=161;
n=5;

for i=1:1:170
    auxs1(m)=x2(n);
    auxt1(m)=((1)^w+(1-x2(n))^w)^(1/w);
    m=m+1;
    n=n+1;
end

for i=150:1:170
    
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

for i=150:1:170
    
    Nt(i)=1-Nt1(i);
    
end

xf = 1:1:170;
subplot(2,3,2)
plot(xf, Ns)
title('Norma S Yager (w = 5)')
xlabel('Altura [cm]')
ylabel('\mu (x)')
grid on

subplot(2,3,5)
plot(xf, Nt)
title('Norma T Yager (w = 5)')
xlabel('Altura [cm]')
ylabel('\mu (x)')
grid on

%---------------------------------------
%------------------------
w=100;


for i=150:1:156
    auxs1(i)=x1(i);
    auxt1(i)=((1-x1(i))^w+(1)^w)^(1/w);
end

j=157;
k=156;
l=1;

for i=1:1:5
    auxs1(j) = (x1(k)^w + x2(l)^w)^(1/w);
    auxt1(j) = ((1-x1(k))^w+(1-x2(l))^w)^(1/w);
    j=j+1;
    k=k+1;
    l=l+1;
end
m=161;
n=5;

for i=1:1:170
    auxs1(m)=x2(n);
    auxt1(m)=((1)^w+(1-x2(n))^w)^(1/w);
    m=m+1;
    n=n+1;
end

for i=150:1:170
    
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

for i=150:1:170
    
    Nt(i)=1-Nt1(i);
    
end

xf = 1:1:170;
subplot(2,3,3)
plot(xf, Ns)
title('Norma S Yager (w = 100)')
xlabel('Altura [cm]')
ylabel('\mu (x)')
grid on

subplot(2,3,6)
plot(xf, Nt)
title('Norma T Yager (w = 100)')
xlabel('Altura [cm]')
ylabel('\mu (x)')
grid on