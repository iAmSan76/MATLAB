clc;close all;
%plot(x1,y0);

fr2 = fft(y1);
fr3 = fft(y2);
fr4 = fft(y3);
fr5 = fft(y4);
figure();
plot(x,fr2);grid("minor");
figure();
plot(x,fr3);grid("minor");
figure();
plot(x,fr4);grid("minor");
figure();
plot(x,fr5);grid("minor");

