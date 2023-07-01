clear all
close all

%% universo
error = -90:0.01:90;

mf1 = trapmf(error,[-90,-90,-60,-30]);
mf2 = trimf(error,[-60,-30,0]);
mf3 = trimf(error,[-30,0,30]);
mf4 = trimf(error,[0,30,60]);
mf5 = trapmf(error,[30,60,90,90]);

voltaje = -15:0.01:15;

mf6 = trapmf(voltaje,[-15,-15,-10,-5]);
mf7 = trimf(voltaje,[-10,-5,0]);
mf8 = trimf(voltaje,[-5,0,5]);
mf9 = trimf(voltaje,[0,5,10]);
mf10 = trapmf(voltaje,[5,10,15,15]);

singleton = zeros(size(error));

%% fusificación

pos_interseccion = 0;
interseccion_a = 0;
interseccion_b = 0;
interseccion_c = 0;
interseccion_d = 0;
interseccion_e = 0;

entrada = 15;
for i = 1:1:length(error)
    if(entrada == error(i))
        singleton(i) = 1;
        pos_interseccion = i;
%         error(i)
        interseccion_a = min(mf1(i),singleton(i));
        interseccion_b = min(mf2(i),singleton(i));
        interseccion_c = min(mf3(i),singleton(i));
        interseccion_d = min(mf4(i),singleton(i));
        interseccion_e = min(mf5(i),singleton(i));
    end
end
% error(pos_int);
% singleton(pos_int) = 1;



%% graficas
subplot(1,3,1)
h1 = plot(error,mf1,'linewidth', 1);
hold on
h2 = plot(error,mf2,'linewidth', 1);
h3 = plot(error,mf3,'linewidth', 1);
h4 = plot(error,mf4,'linewidth', 1);
h5 = plot(error,mf5,'linewidth', 1);
h6 = plot(error,singleton,'k--','linewidth', 2);

if(interseccion_a ~= 0)
    h7 = plot(error(pos_interseccion),...
        interseccion_a,'k*','linewidth', 2);
end

if(interseccion_b ~= 0)
    h8 = plot(error(pos_interseccion),...
        interseccion_b,'k*','linewidth', 2);
end

if(interseccion_c ~= 0)
    h9 = plot(error(pos_interseccion),...
        interseccion_c,'k*','linewidth', 2);
end

if(interseccion_d ~= 0)
    h10 = plot(error(pos_interseccion),...
        interseccion_d,'k*','linewidth', 2);
end

if(interseccion_e ~= 0)
    h11 = plot(error(pos_interseccion),...
        interseccion_e,'k*','linewidth', 2);
end
ylabel('Pertenencia')
xlabel('universo de discurso - Error')
title('Error','FontSize',14)

%% Inferencia Lógica
ENG = interseccion_a; VPG = mf10;
ENP = interseccion_b; VPP = mf9;
ECE = interseccion_c; VCE = mf8;
EPP = interseccion_d; VNP = mf7;
EPG = interseccion_e; VNG = mf6;

mf6_recortado = min(ENG,VPG);%Si ENG, entonces VPG
mf7_recortado = min(ENP,VPP);
mf8_recortado = min(ECE,VCE);
mf9_recortado = min(EPP,VNP);
mf10_recortado = min(EPG,VNG);

%% Agregación 
funcion_agregada = max(mf6_recortado,...
                       max(mf7_recortado,...
                       max(mf8_recortado,...
                       max(mf9_recortado,...
                       mf10_recortado))));
%% Defusificación

y_centroide = defuzz(voltaje,funcion_agregada,'centroid');
%% Voltaje
subplot(1,3,2)
plot(voltaje,mf6,'k','linewidth', 3);
hold on 
plot(voltaje,mf7,'k','linewidth', 3);
plot(voltaje,mf8,'k','linewidth', 3);
plot(voltaje,mf9,'k','linewidth', 3);
plot(voltaje,mf10,'k','linewidth', 3);
plot(voltaje,mf6_recortado,'g--','linewidth', 3);
plot(voltaje,mf7_recortado,'g--','linewidth', 3);
plot(voltaje,mf8_recortado,'g--','linewidth', 3);
plot(voltaje,mf9_recortado,'g--','linewidth', 3);
plot(voltaje,mf10_recortado,'g--','linewidth', 3);
ylabel('Pertenencia','FontSize',14)
xlabel('Universo de discurso - Volatje','FontSize',14)
title('Voltaje','FontSize',14)

singleton_centroide = zeros(size(voltaje));
% singleton_centroide(1320) = 1;
%% Salida de control
subplot(1,3,3)
plot(voltaje,funcion_agregada,'k','linewidth', 3);
hold on
fill(voltaje,funcion_agregada,'c');
plot([y_centroide,y_centroide],[0,1],'r--','linewidth', 3);
% h10 = plot(voltaje,mf8_recortado,'c--','linewidth', 3);
plot(y_centroide,funcion_agregada,'b.','linewidth', 0.001);
grid on
title('Interpretación método Centroide','FontSize',14)
xlabel('Voltaje','FontSize',14)
ylabel('Pertenencia','FontSize',14)