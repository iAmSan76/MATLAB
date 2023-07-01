%Banda de paso: 150- 250 Hz
%Ancho de banda de transición ftr = 50 Hz
%Características de atenuación: Ap <= 0.1dB, As >= 60 dB
%Kaiser fs= 1khz
clc; close all; clear all;

filtro = fir1(50,[0.150 0.250],kaiser(51,0.1));
freqz(filtro,1,512)
n=-(N-1)/2:(N-1)/2;
stem(n,h); grid on
