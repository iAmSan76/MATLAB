N=75;
h_rect = boxcar(N);
h_hann = hanning(N);
h_hamm = hamming(N);
h_blac = blackman(N);
n=1:75;
plot(n,h_rect,'b',n,h_hann,'g',n,h_hamm,'r',n,h_blac,'m');
legend('Rectangular','Hanning','Hamming','Blackman');
axis([0 80 0 1.2])

clf
[H_rect,w] = freqz(h_rect);
[H_hann,w] = freqz(h_hann);
[H_hamm,w] = freqz(h_hamm);
[H_blac,w] = freqz(h_blac);

figure()
subplot(4,1,1)
semilogy(w, abs(H_rect))
axis([0 1 10e-5 10e2]);grid on
subplot(4,1,2)
semilogy(w,abs(H_hann));
axis([0 1 10e-5 10e2]);grid on
subplot(4,1,3)
semilogy(w,abs(H_hamm));
axis([0 1 10e-5 10e2]); grid on
subplot(4,1,4)
semilogy(w,abs(H_blac));
axis([0 1 10e-5 10e2 ]);grid on

