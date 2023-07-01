function c_k=fscoeficiente(k)

if k==0
    c_k=0;
else
    %c_k = abs((3/5j)*(exp(7.87*k)+exp(-7.87*k)-2)/(3.15*k));
    c_k = abs((3/2.5)*((exp(-1i*2*pi*k))/(-6.32*k^2+1.57)*(j*2*pi*k)/(2.5)-1/(-6.31*k^2+1.57)*(j*2*pi*k)/(2.5)));
    %c_k=((1j*2)/(pi*k))*(-1)^k;
    %c_k = abs(1.2*(-(0.15873*j)*exp(-7.875*k)- (0.153846 *j)*exp(8.125*k)+(0.312576*j)  )/k);
end

end