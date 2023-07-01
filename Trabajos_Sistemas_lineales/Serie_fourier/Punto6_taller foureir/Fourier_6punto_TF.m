t=-50:1:50;
x_t= 1/2*(sin(t)).^2-cos(t).^2+2*(sin(t)).^2+3*cos(3*t);

figure()
plot(t,x_t);

