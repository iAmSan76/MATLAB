RGB = imread('lena.png');
%Se evidencia el tamaño de la matiz lena, filas luego columnas
[n_rows, n_colums]=size(RGB)

%color Verde en la imagen
G = RGB(:,:,2);
%creamos el histograma con los respetcivos parametros
figure()
histogram(G,'BinMethod','integers','FaceColor','g','EdgeAlpha',0,'FaceAlpha',0.7)
hold on
xlabel('bits/valor verde')
ylabel('Frecuencia')
title('Histograma resaltando color verde')
xlim([0 257])