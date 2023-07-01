close all; clear all; clc;

%Funcion de primer orden
G1=tf([10],[2 1])
figure();
step(G1);
%Funcion del sistema amortiguado
G2=tf([10],[4 10 1])
figure()
step(G2);
%Funcion del sistema criticamente amortiguado
G3=tf([10],[4 4 1])
figure
step(G3);
%Funcion del sistema subamortiguado
G4=tf([10],[4 1 1])
figure()
step(G4);
%Sistema integrado
G5=tf([0.3],[1 0])
figure()
step(G5);
%lead-lag
G6=tf([30 10],[2 1])
figure()
step(G6);
%Respuesta Inversa
G7=tf([-20 10],[4 10 1])
figure()
step(G7);
%Sistema inestable
G8=tf([30 10],[-2 1])
figure()
step(G8);
%%----------------Funciones
figure
step(G1,G2,G3,G4,G5,G6,G7);
legend('G1','G2','G3','G4','G5','G6','G7');