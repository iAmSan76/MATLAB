close all; clear; clc;

%Valores de corte
ts=0.01; 
t=0:ts:1;
mm=0:ts:1;
nn=0:ts:1;
L=length(t);

%%UNIVERSOS
Trapezio = trapmf(t,[0.3 0.4 0.5 0.6]);
Triangulo = trimf(t,[0.4 0.5 0.6]);

%%FUSIFICACIONES

%Mamdani minimo
uM=zeros(L);
for x=1:L
    for y=1:L
       uM(x,y)=min(Trapezio(x),Triangulo(x));
    end
end

%Producto local
pl = zeros(L); 
for x=1:1:L
    for y=1:1:L
      pl(x,y)=Trapezio(x)*Triangulo(y);
    end
end
%Dienes-Rescher
uD=zeros(L);
for x=1:1:L
    for y=1:1:L
      uD(x,y)=max(1-Trapezio(x),Triangulo(y));
    end
end

%Lukasiewickz
uL=zeros(L);
for x=1:L
    for y=1:L
       uL(x,y)=min(1,(1-Trapezio(x))+Triangulo(y));  
    end
end

%Godel
uG=zeros(L);
% for x=1:L
%     for y=1:L
%        if(Triangulo(y)<=Trapezio(x)) 
%            uG=1;
%        else
%            uG=Trapezio(x);
%        end 
%     end
% end

for x=1:L
    for y=1:L
       uG(x,y)=max(Trapezio(x),Triangulo(y));  
    end
end
%GRAFICAS --------

%grafica trapezoidal
figure()
subplot(211);
stem(t,Trapezio,'r');
ylim([-0.01 1.1]);xlim([0 1]);
grid minor
title('Funcion de pertinencia trapezoidal')
%grafica triangular
subplot(212);
stem(t,Triangulo,'g');
ylim([-0.01 1.1]);xlim([0 1]);
grid minor
title('Funcion de pertinencia triangular')
%grafica Mandami minimo
figure()
surf(mm,nn,uM);
ylim([-0.01 1.02]);xlim([0 1]);
grid minor
title('Funcion de Mamdani Minimo')
%grafica producto (local)
figure()
surf(mm,nn,pl)
ylim([-0.01 1.02]);xlim([0 1]);
grid minor
title('Funcion de producto local')
%grafica Dienes-Rescher
figure()
surf(mm,nn,uD);
ylim([-0.01 1.02]);xlim([0 1]);
grid minor
title('Funcion de Dienes-Rescher')
%grafica Lukasiewickz
figure()
surf(mm,nn,uL);
ylim([-0.01 1.02]);xlim([0 1]);
grid minor
title('Funcion de Lukasiewickz')
%grafica Godel
figure()
surf(mm,nn,uG);
ylim([-0.01 1.02]);xlim([0 1]);
grid minor
title('Funcion de Godel')
