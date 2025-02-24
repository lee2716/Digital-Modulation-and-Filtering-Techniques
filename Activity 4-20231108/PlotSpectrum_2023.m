function [pxx,f] = PlotSpectrum_2023(x,fs)
% Plots the power spectrum of signal x
% x: vector containing the samples of the signal
% fs: sampling rate
[pxx,f] = pwelch(x,[],[],[],fs,'centered');
plot(f,10*log10(pxx))
xlabel('f (Hz)');
ylabel('dB_{{V^2}/Hz}');
grid;
end