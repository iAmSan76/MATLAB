n = -8:1:8; % Vector de tiempo discreo
x_n= [0,0,0,0.5,1,1.5,2,2.5,3,2.5,2,1.5,1,0.5,0,0,0] ; % señal x_n
stem(n,x_n) ; % Dibujar la señal
title( ' Señal de tiempo discreto' ) ;
xlabel( 'n , [ sample ] ' ) ;
ylabel( ' Amplitud ' ) ;