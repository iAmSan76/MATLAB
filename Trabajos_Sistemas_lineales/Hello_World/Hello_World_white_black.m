I=imread('grayscale.png');
[n_rows, n_colums]=size(I);
I2=imread('grayscale.png');

Ilight=I+100;
Idark=I-100;

figure(1)
imshow(I)
figure(2)
imshow(Idark)

for i = 0: 1 : n_rows
    for j = 0: 1 :n_colums
        if I (i,j)<= 128
            I2(i,j) = 255;
        else
            I2(i,j) = 0 ;
        end
    end
end

figure()
imshow(I2)