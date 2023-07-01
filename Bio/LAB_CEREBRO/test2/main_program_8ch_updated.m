
%% CARGAR ARCHIVO

clear all;
close all;
clc;

%% CARGAR ARCHIVO

% Prompt user for filename
[fname, fdir] = uigetfile( ...
{  '*.txt*',    'Text Files (*.txt*)'; ...
   '*.xlsx',    'Excel Files (*.xlsx)'; ...
   '*.csv*',    'Text Files (*.csv)'}, ...
   'Pick a file');

% Cree un nombre de archivo completamente formado como una cadena o string
filename = fullfile(fdir, fname);

% se revisa wue existe el documento
assert(exist(filename, 'file') == 2, '%s does not exist.', filename);

% lee los datos, evitando las primeras 5 filas
data = readmatrix(filename);
        

%% GENERAL PARAMETERS

% Separar EEG data y aux data         
eegdata = data(:,2:9);          % EEG data
auxdata = data(:,10:12);        % Aux data

% Variables Generales
time = (0:4:length(eegdata)*4-1)';  % Time vector
N_ch = 8;                           % Number of channels

% parametros filtro pasa bandas
fsamp = 250;                    % Sampling frequency
tsample = 1/fsamp;              % Period of samples
f_low = 50;                     % Cut frequency for high-pass filter
f_high = 1;                     % Cut frequency for low-pass filter

%% PRE-PROCESSING
% filtro pasa banda
for i=1:N_ch
    EEG(:,i)= bandpass_filter_8ch(eegdata(:,i), fsamp, f_low, f_high);
end

%% SAVE EEG DATA para EEGLAB
% Save raw data (unfiltered data)
save eegdata.txt eegdata -ascii;
save('eegdata.mat','eegdata');

% Save filterd data
save EEG.txt EEG -ascii;
save('EEG.mat','EEG');