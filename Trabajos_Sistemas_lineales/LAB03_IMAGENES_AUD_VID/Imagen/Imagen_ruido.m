
Im = imread('dog.png');

J = imnoise(Im,'gaussian',0.1);
J2 = imnoise(Im,'gaussian',0.2);
J3 = imnoise(Im,'gaussian',0,0.3);

figure()
subplot(1,3,1),imshow(J)
figure()
subplot(1,3,2),imshow(J2)
figure()
subplot(1,3,3),imshow(J3)

