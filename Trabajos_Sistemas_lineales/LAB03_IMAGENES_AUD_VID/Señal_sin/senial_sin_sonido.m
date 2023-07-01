N_samples = 100000;
fs = 22050;
fc = 100;
t = (0:N_samples-1)/fs;
x = 0.1* sin (2* pi* fc * t ) ;

sound(x , fs )
audiowrite('sinsound.wav',x ,fs);

