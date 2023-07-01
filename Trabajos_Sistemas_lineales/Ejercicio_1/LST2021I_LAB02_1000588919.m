clear;
close all;
clc;


settings.fs = 1e4 ;
settings.ts = 1/settings.fs;

%
signal.ti = 0;      %tiempo inicial
signal.tf = 0.1;    %tiempo final
t = signal.ti:settings.ts:signal.tf;

signal.tm = 1e-1;                 %duracion de la señal
L = round(signal.tm/settings.ts); % Samples
t = (0:L-1) * settings.ts;

f_1 = 1.5e3 ; %[Hz]
f_2 = 2*f_1 ; %[Hz]
s1 = cos(2*pi*f_1*t) ; % Carrier based on time vector;
s2 = cos(2*pi*f_2*t) ; % Carrier based on time vector;

figure(1)
plot(t/1e-3,s1);

hold on
plot(t/1e-3,s2,'-','LineWidth',2 ,'Color',[0.8500 0.3250 0.0980] );
hold off
xmin=0; xmax=0.5; ymin= -1.1; ymax=1.1; % Box size
Box=[xmin xmax ymin ymax ];
labels = {'t,[ms]','s_n(t)'}; %labelx, labely
legends = {'$s_1(t)$','$s_2(t)=-\int_0^\pi {s_1( t ) dt}$'};
h=legend(legends) ;
set(h ,'Interpreter' , 'latex' , 'Location' , 'NorthEast' , 'FontSize' ,16 , 'FontWeight' , 'bold' , 'Orientation' , 'vertical');
xlabel( labels(1) , 'fontsize' ,16 , 'FontAngle' , 'Italic');
ylabel( labels(2) , 'fontsize' ,16) ;
xlim ( [ Box(1) Box(2) ] ) ; ylim ( [ Box(3) Box(4) ] ) ;
grid(gca , 'minor' ) ;

set( gcf , ' Position ' , get(0,'Screensize')); % Maximize figure.
saveas(gca , ' example1 ' , 'png ' ) ;
print( ' example2 ' , ' -dpng ' , ' - r600 ' ) ; % Save as PNG with 600 DPI
saveas(gca , ' example1.fig ' ) ;



