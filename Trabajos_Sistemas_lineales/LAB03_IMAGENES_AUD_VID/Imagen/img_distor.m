
Im = imread('pepper_Gris.png');

J = imnoise(Im,'gaussian',0.1);
J2 = imnoise(Im,'gaussian',0.2);
J3 = imnoise(Im,'gaussian',0,0.3);

figure()
imshow(J)
figure()
imshow(J2)
figure()
imshow(J3)
