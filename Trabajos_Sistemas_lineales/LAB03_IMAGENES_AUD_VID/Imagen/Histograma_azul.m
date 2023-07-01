RGB = imread('lena.png');
%Se evidencia el tamaño de la matiz lena, filas luego columnas
[n_rows, n_colums]=size(RGB)

%color Azul en la imagen
B = RGB(:,:,3);
%creamos el histograma con los respetcivos parametros
figure()
histogram(B,'BinMethod','integers','FaceColor','b','EdgeAlpha',0,'FaceAlpha',0.7)
hold on
xlabel('bits/valor Azul')
ylabel('Frecuencia')
title('Histograma resaltando color azul')
xlim([0 257])