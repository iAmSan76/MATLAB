%Convolucion de señales continuas

%Paso del tiempo en el eje x
ts =.01;
%Intervalos en los que estara el primer arreglo de datos o la funcion x[n]
gox=0; stopx =1/2;
%Intervalos en los que estara el segundo arreglo de datos o la funcion h[n]
goh=0; stoph =2;
%Se inicializa el primer arreglo o el vector que se recorre con ts
tx=gox:ts:stopx;
%Funcion x[n] con euler que esta elevado al primer arreglo o vector
x=exp(-tx);
%Se inicializa el psegundo arreglo o el vector que se recorre con ts
th=goh:ts:stoph;
%Funcion h[n] con euler que esta elevado al primer arreglo o vector
h=exp(-th);
%Se crea el tercer vector que va a ser los datos de la convolucion
ty=gox+goh:ts:stopx+stoph;
%Se procede hacer la convolucon entre x(t) y h(t)
y=ts*conv(x,h);
%Se indica que se va a usar una figura llamada "Convolution" para visualizar la grafica
figure("Name","convolution")
%Se muestra la figura en la parte superior de la figura o ventana "Convolution"
subplot(311)
%Se muestra la primera grafica la cual tendra como variable dependiente x, y
%la variable independiente sera tx
plot(tx,x)
%Muestra que en el eje x tendra un nombre de "t" mientras que en el eje y lo tendra de "x(t)"
xlabel('t'), ylabel('x(t)')
%Se muestra la figura en la mitad de la figura o ventana "Convolution"
subplot(312)
%Se muestra la segunda grafica la cual tendra como variable dependiente th, y
%la variable independiente sera h
plot(th,h)
%Muestra que en el eje x tendra un nombre de "t" mientras que en el eje y lo tendra de "h(t)"
xlabel('t'), ylabel('h(t)')
%Se muestra la figura en la parte inferior de la figura o ventana "Convolution"
subplot(313)
%Se muestra la tercer grafica la cual tendra como variable dependiente ty,
%y la variable independiente sera y
plot(ty,y)
%Muestra que en el eje x tendra un nombre de "t" mientras que en el eje y 
%lo tendra de "y(t)=x(t)*h(t)"
xlabel('t') , ylabel('y(t)=x(t)*h(t)')