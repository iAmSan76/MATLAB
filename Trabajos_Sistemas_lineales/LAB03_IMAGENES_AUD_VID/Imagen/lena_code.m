%Se crea el vector RGB en donde se leera la imagen de lena
RGB = imread('lena.png');

gray = rgb2gray(RGB)
figure
imshow(gray)