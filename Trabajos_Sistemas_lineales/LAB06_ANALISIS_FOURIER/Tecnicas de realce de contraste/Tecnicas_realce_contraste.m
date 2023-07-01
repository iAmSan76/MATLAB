clc; close all; clear all;

%Se carga la imagen
Imagen = imread('lena.png');
%Se trabaja en escala de grises
pout = rgb2gray(Imagen);
figure()
imshow(pout)
%tecnica 1
pout_imadjust = imadjust(pout);
figure()
imshow(pout_imadjust);
%Tecnica 2
pout_histeq = histeq(pout);
figure()
imshow(pout_histeq);
%Tecnica 3 
pout_adapthisteq = adapthisteq(pout);
figure()
imshow(pout_adapthisteq);

%Mosaico
montage({pout,pout_imadjust,pout_histeq,pout_adapthisteq},'Size',[1 4])
title("Original Image and Enhanced Images using imadjust,histeq,and adapthisteq");

%Histogramas
figure()
imhist(pout,64)%ENTRADA
figure()
imhist(pout_imadjust,64)%SALIDA 1
figure()
imhist(pout_histeq,64)%SALIDA 2
figure()
imhist(pout_adapthisteq,64)%SALIDA 3






