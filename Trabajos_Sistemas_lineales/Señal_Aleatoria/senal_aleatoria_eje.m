Tpulse = 20e-3;
Fs = 10e3;
t = -1: 1 / Fs: 1;
x = rectpuls (t, Tpulse);

rng default

SNR = 53;
y = randn(size(x))*std(x)/db2mag(SNR);

s = x + y;
Fi = 2500;
Fs = 48e3;
N = 1024;
x = sin(2*pi*Fi/Fs*(1:N)) + 0.001*randn(1,N);
SNR = snr(x,Fs)

snr(x,Fs);