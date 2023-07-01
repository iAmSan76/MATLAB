function x_T = periodizador(t_i,t_f,t,T)

x_T=zeros(1,length(t));

%se hace la suma de a funcion en distintos periodos para eso se corrige
for tx=t_i:T:t_f 
    %Con la funcion de la funcion ventana
    x_T=x_T+((t-tx).*ventana(tx-2,(tx+2),t));  
end

end