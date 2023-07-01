clear all; close all; clc;

CodeLength = [1 2 3 4 5 7 11 13]';
psl = zeros(length(CodeLength),1);
barker = comm.BarkerCode;
for ii=1:length(CodeLength)
    spf = CodeLength(ii);
    barker.Length = CodeLength(ii);
    barker.SamplesPerFrame = spf;
    seq = barker();
    sll_dB = 20*log10(abs(xcorr(seq)));
    psl(ii) = -(max(sll_dB));
    release(barker);
end
Sidelobe_dB = psl;
figure()
T = table(CodeLength,Sidelobe_dB)