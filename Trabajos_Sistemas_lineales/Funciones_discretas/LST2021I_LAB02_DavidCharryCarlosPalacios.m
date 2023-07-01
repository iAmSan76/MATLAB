
clear all;
close all; 
clc;
settings.fs = 1e4;
settings.ts=1/settings.fs; %step in time
signal.ti=0; %initial time
signal.tf=0.1; %final time
t=signal.ti:settings.ts:signal.tf;
signal.tm=1e-1;
L = round(signal.tm/settings.ts);
t=(0:L-1)*settings.ts;
f_1 = 1.5e3; %[Hz]
f_2 = 2*f_1;
s1 = cos(2*pi*f_1*t);
s2 = cos(2*pi*f_2*t);
figure(1)
plot(t/1e-3, s1);
hold on
plot(t/1e-3,s2,'-','LineWidth',2,'Color',[0.8500 0.3250 0.0980]);
hold off
xmin=0; xmax=0.5; ymin=-1.1; ymax = 1.1; %box size
Box = [xmin xmax ymin ymax];
labels={'t, [ms]', 's_n(t)'};
legends = {'$s_1(t)$','$s_2(t)=\int_0^\pi {s_1(t) dt}$'};
h=legend(legends);
set(h,'Interpreter','latex','location', 'NorthEast', 'FontSize', 16, 'FontWeight','bold','Orientation','vertical');
xlabel(labels(1), 'fontsize',16,'FontAngle','Italic');
ylabel(labels(2),'fontsize',16);
xlim([Box(1) Box(2)]); ylim([Box(3) Box(4)]);
grid(gca, 'minor');
set(gcf,'Position',get(0,'Screensize'));
saveas(gca, 'example1','png');
print('example2','-dpng','-r600');
saveas(gca,'example1.fig');
noise=0.1*randn(1,length(s1));
save('noisesignal.mat','noise');
load('noisesignal.mat','noise');
subplot(2,2,1);
plot(t/1e-3,noise,'-','linewidth',1,'Color',[0.3010 0.7450 0.9330]);
labels= {'t, [ms]','n(t)'};
xmin = 0; xmax=0.5; ymin=min(noise)-0.2; ymax=max(noise)+0.2;
Box=[xmin xmax ymin ymax];
xlim([Box(1) Box(2)]); ylim([Box(3) Box(4)]);
grid(gca, 'minor');
title('Ruido Aleatorio');
subplot(2,2,2);
h=histogram(noise);
h.Normalization='Probability';
h.BinWidth = 0.01;
h.FaceColor = [0.3010 0.7450 0.9330];
h.EdgeColor = 'k';
title('Histograma del ruido aleatorio')
subplot(2,2,[3 4]);
plot(t/1e-3,s1+noise,'-','LineWidth',2,'Color',[0.3010 0.7450 0.9330]);
hold on
plot(t/1e-3,s1,'-','linewidth',2,'Color', [0 0.4470 0.7410]);
hold off
xmin=0; xmax=0.5; ymin=min(s1+noise)-0.3; ymax =max(s1+noise)+0.3;
Box=[xmin xmax ymin ymax];
labels={'t,[ms]','s_n(t)'};
legends={'$s_1(t)+n(t)$','$s_1(t)$'};
h=legend(legends);
set(h,'Interpreter','latex','location', 'NorthEast', 'FontSize', 16, 'FontWeight','bold','Orientation','vertical');
xlabel(labels(1), 'fontsize',16,'FontAngle','Italic');
ylabel(labels(2),'fontsize',16);
xlim([Box(1) Box(2)]); ylim([Box(3) Box(4)]);
grid(gca, 'minor');
title('Senal sinusoidal contaminada con ruido');