%frecuencia de corte = 1.5khz
%ancho de banda de transicion ftr = 0.5khz
%atenuacion >50dB
%fs = 8khz

h=fir1(20,0.15,"low");
freqz(h,1)