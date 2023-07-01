 close all; clear all; clc;

%Alturas denominadas
ts=0.01; 
t1=1.50:ts:1.60;%bajo
t2=1.57:ts:1.70;%medio
t3=1.67:ts:1.82;%alto

%Funcion a trozos
x1=(20.*t1-30).*cwindow(1.50,1.55,t1)+(-20.*t1+32).*cwindow(1.55,1.60,t1);
x2=(12.5.*t2-19.625).*cwindow(1.57,1.65,t2)+(-20.*t2+34).*cwindow(1.65,1.70,t2);
x3=(12.5.*t3-20.875).*cwindow(1.67,1.75,t3)+(-14.286.*t3+26).*cwindow(1.75,1.82,t3);

%Grafica de las funciones
figure("Name",'valores alturas');
plot(t1,x1,t2,x2,t3,x3,'g');
ylim([-0.01 1.02]);xlim([1.49 1.83]);
grid minor
xlabel('Altura [m]');
ylabel('Pertinencia');
legend('Bajo','Medio','Alto');
title('Funcion de pertinencia de altura')

%%
%Norma S-Yager
%cuando w=1
w=1;
for i=1:1:1.57
    auxs1(i)=x1(i);
    auxt1(i)=((1-x1(i))^w+(1)^w)^(1/w);
end

j=1.58;
k=1.57;
l=1;

for i=1:1:1.57
    auxs1(j) = (x1(k)^w + x2(l)^w)^(1/w);
    auxt1(j) = ((1-x1(k))^w+(1-x2(l))^w)^(1/w);
    j=j+1;
    k=k+1;
    l=l+1;
end
m=1.62;
n=1.57;

for i=1:1:1.57
    auxs1(m)=x2(n);
    auxt1(m)=((1)^w+(1-x2(n))^w)^(1/w);
    m=m+1;
    n=n+1;
end

for i=1:0.1:1.71
    
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

for i=1:0.1:1.71
    
    Nt(i)=1-Nt1(i);
    
end

xf = 1.50:0.1:1.82;
figure
subplot(2,3,1)
plot(xf, Ns,'linewidth',2)
title('Norma S Yager (w = 1)')
xlabel('Precio')
ylabel('\mu (x)')
grid on

subplot(2,3,4)
plot(xf, Nt,'linewidth',2)
title('Norma T Yager (w = 1)')
xlabel('Precio')
ylabel('\mu (x)')
grid on
