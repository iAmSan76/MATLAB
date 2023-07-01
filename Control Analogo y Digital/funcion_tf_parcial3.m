%Funcion del sistema criticamente amortiguado
clc ;clear all;close all;
G3=tf([8],[10 8 2])
pzmap(G3)
figure
step(G3);