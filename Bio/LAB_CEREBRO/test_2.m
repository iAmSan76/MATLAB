clc;close all;
%plot(x1,y0);
xlim([0 10]);

fr2 = fft(y1);
fr3 = fft(y2);
fr4 = fft(y3);
fr5 = fft(y4);
figure();
plot(x1,fr2);grid("minor");hold on;
figure();
plot(x1,fr3);grid("minor");hold on;
figure();
plot(x1,fr4);grid("minor");hold on;
figure();
plot(x1,fr5);grid("minor");hold on;