function window = cwindow(vi,vf,t)

ui=zeros(1,length(t));
vi_index=find(t==vi);
ui(vi_index:end)=1; % u(t_0:end)=ones(1,length(t(t_0:end)));

uf=zeros(1,length(t));
vf_index=find(t==vf);
uf(vf_index:end)=1; % u(t_0:end)=ones(1,length(t(t_0:end)));
window=ui-uf;


end