clc ;clear all;close all;
%Funcion del sistema de llenado y vaciado del tanque
G=tf([1],[0.5 1/4])+tf([-1],[0.5 1/2])
%pole(G)
figure
pzplot(G,'b')
xlim([-1.2 0]);
xlabel("Eje Real ");
ylabel("Eje Imaginario ");
title("Gráfica de polos y ceros");
grid minor
figure
step(G);

%Funcion discreta
GD = c2d(G,[0.1])
figure
step(G,GD)
sisotool(GD)
