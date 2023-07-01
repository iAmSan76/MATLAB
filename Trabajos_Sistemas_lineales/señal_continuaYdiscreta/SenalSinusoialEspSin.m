fs = 500e3 ;     % Frecuencia aparente de Matlab 500 kHz
f = 10e3 ;       % Frecuencia de la señal sinusoide
ti = 0;          % Tiempo incial de la señal [s]
nCyl=5;          % Numero de ciclos (periodos) a generar de la sinusoidal
t=ti:1/fs:nCyl*1/f ;   % Vector de tiempo conntinuo
x=cos(2*pi*f*t) ;      % Señal sinusoide
figure
plot(t,x)        % Se dibuja la señal
title('Señal sinusoidal continua') ;
xlabel( 'Tiempo , [s] ' ) ;
ylabel( ' Amplitud ' ) ;
figure
[f,X]=spectrumGen(x,fs,2) ; % Espectro bidireccional de la señal y vector de frecuencia
plot(f,X)        % Se dibuja la señal
title( ' Espectro de la señal sinusoidal' ) ;
xlabel( ' Frecuencia , [Hz] ' ) ;
ylabel( ' Amplitud ' ) ;

function [freq,X]=spectrumGen(signal,fs,side)
%--------------------------------------------------
%   signal    --- señal de entrada
%   fs   --- frecuencia de muestreo 
%   side --- transformada de Fourier de un lado (1) o dos lados (2)
%   X    --- magnitud de la transformada de Fourier
%   freq --- eje de frecuencia en Hz 
%--------------------------------------------------
	Np=8192;							% Número de puntos de la DFT
	L=length(signal);					% Longitud de la señal
	ts=(1/fs);							% Tiempo de muestreo
	Mp=ceil(Np/2);						% Mitad de puntos de la FFT
	wd=0:2*pi/Np:2*pi*(Np-1)/Np;		% Vector de Frec. discreta
	wdo=zeros(1,Np);					% Vector de Frec. disc. organizadas
	wc=zeros(1,Np);						% Vector de Frec. cont. en rad/seg
	fc=zeros(1,Np);						% Vector de Frec. cont. en Hz
	z=abs(fft(signal,Np));					% Magnitud de FFT de la señal
	zo=zeros(1,Np);						% Vector para reorganizar la FFT
	t=0:ts:ts*(L-1);					% Vector de tiempo

	% Reorganización de frecuencias
	wdo(Np-Mp+1:end)=wd(1:Mp);
	wdo(1:Np-Mp)=wd(Mp+1:end)-2*pi;

	% Frecuencia continua en Hz
	wc=wdo/ts;
	fc=wc/(2*pi);

	% Reorganización de la FFT
	zo(Np-Mp+1:end)=z(1:Mp);
	zo(1:Np-Mp)=z(Mp+1:end);

	X=zo;
	freq=fc;
end
