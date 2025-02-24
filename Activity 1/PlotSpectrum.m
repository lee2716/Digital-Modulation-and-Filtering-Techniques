% Written by Davide Dardari - University of Bologna - 2015
%
function [pxx, f, h] = PlotSpectrum(x,fs)
% Plots the power spectrum of signal x
% x: vector containing the samples of the signal
% fs: sampling rate
%figure;
[pxx,f] = pwelch(x,[],[],[],fs,'centered');
% [pxx,f] = periodogram(x,hamming(length(x)),length(x),fs,'centered');
h=plot(f,10*log10(pxx));
xlabel('f (Hz)'); ylabel('dB_{{V^2}/Hz}');
grid;
end

