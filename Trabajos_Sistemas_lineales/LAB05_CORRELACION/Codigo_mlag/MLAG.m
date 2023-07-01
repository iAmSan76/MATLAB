clear all; close all; clc;

%Se define el periodo
N=128;
%Se define omega o frecuencia angular (W)
W=pi/16;
%Se crea un vector que varia entre el elemnto de 0 a N-1
nn=0:N-1;
%Se crea una funcion que tiene omega
s= sin(W*nn) ;
%Devuelve un conjunto de numero aleatorios con dimension de 1xN o 1x128
w= 0.5* randn(1,N);
%Suma la funcion (s) y la matriz aleatoria (w) y la guarda en x
x=s+w;
%Se dividen las graficas y se muestra la represenatación grafica en donde
%tiene como variable independiente nn y como dependiente w
subplot(321),plot(nn,w)
%Se hace autocorrelación y se guardan en un vector
[phi_w,mlag]=xcorr(w,w) ;
%Se muestra la representacion grafica de mlag que es la variable
%independiente y como variable dependiente phi_w
subplot(322) , plot(mlag,phi_w)
%Representacion grafica del vector nn en funcion de x y de s
subplot(323) , plot(nn,x,nn,s,'k')
%Se hace autocorrelacion de x y se guarda en un vector
[phi_x , mlag]= xcorr(x,x);
%Se muestra la grafica de mlag que sera una variable independiente
%mientras que phi_x sera una dependiente
subplot(324) , plot(mlag , phi_x )
%Se hace autocorrelacion pero en este caso se utiliza la opcion normalizada coef, de modo que
%normaliza la secuencia de mlag ya que de 0 dan 1, endonde coef signfica coeficiente
[ phi_x_coef , mlag]= xcorr(x,x,'coef') ;
%Grafica la correlación de phi_x_coef
subplot(325) , plot( mlag , phi_x_coef )
%Se hace correlacion cruzada con la opcion normalizada de biased o estimacion
[ phi_x_biased , mlag]= xcorr(x,x,'biased');
%se muestra el lag de la correlacion con la opcion normalizada de biased
hold on , plot(mlag,phi_x_biased,'r:')
%Se hace autocorrelacion con la opcion normalizada de unbiased o estimacion de autocorrelacion
[ phi_x_unbiased , mlag]= xcorr (x,x,'unbiased');
%Se hace la representación grafica del mlag de la autocorrelacon con la opcion normalizada de 'unbiased'
subplot(326) , plot( mlag , phi_x_unbiased),axis([mlag([1 end]) -1 1])

