N_samples = 100000;
fs = 22050;
fc = 100;
t = (0:N_samples-1)/fs;
x = (0.1* sin (2* pi* fc * t )) ;
%se calcula la potencia 
pot=0.00500;
%creeamos la señal con ruido
senal_ruido = awgn(x,pot/2,'measured');
%sumamos las dos señales la que tiene ruido y la señal normal
w = x+senal_ruido;
sound(w , fs )
audiowrite('sinsoundnoised.wav',w ,fs);

