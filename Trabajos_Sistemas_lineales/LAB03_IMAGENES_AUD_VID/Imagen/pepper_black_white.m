%inicialmente ponemos la imagen que vamos a utilizar en color
I=imread('peppers.png');
%[n_rows, n_colums]=size(I);
%Usamos escala de grises para trasnformar la imagen de color
gray = rgb2gray(I);
[n_rows, n_colums]=size(gray);
%se usa guarda otra imagen en escala de grises para convertirla a blanco y
%negro
gray2 = rgb2gray(I);

figure(1)
imshow(I)
figure(2)
imshow(gray)
%se recorre toda la imagen gris y se cambian los bits para que sean negro o
%blanco
for i = 1: 1 : n_rows
    for j = 1: 1 :n_colums
        if gray(i,j)>= 128
            gray2(i,j) = 255;
        else
            gray2(i,j) = 0 ;
        end
    end
end
%se muestra la imagen en blanco y negro
figure(3)
imshow(gray2)