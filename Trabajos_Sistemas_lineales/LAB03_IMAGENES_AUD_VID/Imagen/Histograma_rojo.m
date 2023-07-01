RGB = imread('lena.png');
%Se evidencia el tamaño de la matiz lena, filas luego columnas
[n_rows, n_colums]=size(RGB)

%color Rojo en la imagen
R = RGB(:,:,1);
%creamos el histograma con los respetcivos parametros
figure()
histogram(R,'BinMethod','integers','FaceColor','r','EdgeAlpha',0,'FaceAlpha',1)
hold on
xlabel('bits/valor rojo')
ylabel('Frecuencia')
title('Histograma resaltando color rojo')
xlim([0 257])