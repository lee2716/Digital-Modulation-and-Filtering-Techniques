% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************
function [t,x,N]=SinusoidalSource_2023(A, f0, T,fs)
Ts=1/fs;
t=0:Ts:T;
x=A*cos(2*pi*f0*t);
N=length(x);
end

close all;
clear all;
clc;
fs=30000; % sampling frequency
A=1; % amplitude of the modulating in-phase and quadrature sine waves
T=0.5; % duration (sec) of the in-phase and quadrature sine waves
f1=100; % frequency of the modulating sine wave xI in the in-phase path
f2=300; % frequency of the modulating sine wave xQ in the quadrature path
fc=3000; % carrier frequency

% generate (and plot) the modulating sine waves xI and xQ
% by means of the SinusoidalSource_2023 function
[t,xI,N]=SinusoidalSource_2023(A,f1,T,fs); % generation of the singal
figure
plot(t,xI,'r')
xlabel('t [s]')
ylabel('x(t) [V]')
title('Original sine wave xI')
axis([min(t) max(t) 1.2*min(xI) 1.2*max(xI)])
signal_power=0.5*A^2;
fprintf('XI power [V^2]=%f' , signal_power)
figure
PlotSpectrum(xI,fs);
title('Spectrum of the sine wave xI');

[t,xQ,N]=SinusoidalSource_2023(A,f2,T,fs); % generation of the singal
figure
plot(t,xQ,'r')
xlabel('t [s]')
ylabel('x(t) [V]')
title('Original sine wave xQ')
axis([min(t) max(t) 1.2*min(xQ) 1.2*max(xQ)])
signal_power=0.5*A^2;
fprintf('sinusoid power [V^2]=%f' , signal_power)
figure
PlotSpectrum(xQ,fs);
title('Spectrum of the sine wave xQ');

% QAM modulation xI and xQ with carrier frequency
% plot the modulated signal and its spectrum
% (use the function PlotSpectrum_2023(s,fs))
s = ModQAM_2023(xI,xQ,fc,T,fs)
figure
plot(t,s,"b")
xlabel("t[s]")
ylabel("s(t) [V]")
title("Modulated signal s(t)")
axis([min(t) max(t) 1.2*min(s) 1.2*max(s)])
figure
PlotSpectrum_2023(s,fs)
title('the modulated signal spectrum')


% QAM demodulation
% plot the demodulated in-phase and quadrature signals and their spectra
[xi,xq,Delay] = DeModQAM_2023(s,fc,T,fs,pi/2)
figure
plot(t,xI,'r')
hold on
plot(t,xi,'b')
legend ('xI(t): original sinusoid','xi(t): output of the demodulator')

xlabel('t [s]')
ylabel('x(t) [V]')
title('demodulated signal xi')
axis([min(t) max(t) 1.2*min(xi) 1.2*max(xi)])
signal_power=0.5*A^2;
fprintf('sinusoid power [V^2]=%f' , signal_power)
figure
PlotSpectrum(xi,fs);
title('Spectrum of the ignal Xi(t)');



figure
plot(t,xQ,'r')
hold on
plot(t,xq,'g')
legend ('xQ(t): original sinusoid','xq(t): output of the demodulator')
xlabel('t [s]')
ylabel('x(t) [V]')
title('demodulated signal xQ')
axis([min(t) max(t) 1.2*min(xq) 1.2*max(xq)])
signal_power=0.5*A^2;
fprintf('sinusoid power [V^2]=%f' , signal_power)

figure
PlotSpectrum(xq,fs);
title('Spectrum of the signal Xq(t)');

s_demod=xi+xq*j
figure
PlotSpectrum_2023(s_demod,fs)
figure
PlotSpectrum_2023(xi,fs)
figure
PlotSpectrum_2023(xq,fs)
title('the demodulated signal spectrum')


















