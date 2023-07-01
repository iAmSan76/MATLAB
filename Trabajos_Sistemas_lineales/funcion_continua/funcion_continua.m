ts = 1e-3;
t = 1:ts:2;
h_t = 1-t.^2;
grid("on")
plot(h_t)