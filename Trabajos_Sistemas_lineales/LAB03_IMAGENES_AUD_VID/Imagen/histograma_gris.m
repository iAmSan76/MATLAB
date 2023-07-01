%Se crea el vector RGB en donde se leera la imagen de lena
RGB = imread('lena.png');
%se trabaja en escala de grises
gray = rgb2gray(RGB);
imshow(gray)

%creamos el histograma con los respetcivos parametros
figure()
histogram(gray)
hold on
xlabel('bits')
ylabel('Frecuencia')
title('Histograma blanco/negro')
xlim([0 257])