% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************
close all
clear all
clc

%% generation of the sinusiod and plot
A=1; % Amplitude of the sinusoid  [V] 
f0=300; % frequency of the sinusoid 
fs=20000; % sampling frequency 
duration=0.05; % singal duration in seconds
[t,x,N]=SinusoidalSource2023(A,f0,duration,fs); % generation of the singal
figure
plot(t,x,'r')
xlabel('t [s]')
ylabel('x(t) [V]')
title('Original signal x(t)')
axis([min(t) max(t) 1.2*min(x) 1.2*max(x)])
hold on
figure
plot(t(1:40),x(1:40),'b')
xlabel('t [s]')
ylabel('x(t) [V]')
title('Original signal x(t)')
axis([min(t) max(t(1:40)) 1.2*min(x) 1.2*max(x)])
hold on
signal_power=0.5*A^2;
fprintf('sinusoid power [V^2]=%f' , signal_power)

%% Noise generation 
sigma=0.6; % std deviation of the noise. The noise power is sigma ^2 [v^2]
noise=sigma*randn(1,N); % generation the noise 
fprintf('Noise power[V^2]=%f', sigma^2)
x_noisy=x+noise; % add Gussian noise to sinusoid 

signal_to_noise_ratio_dB=10*log10(signal_power/(sigma^2));
fprintf('SNR [dB]=%f',signal_to_noise_ratio_dB)

figure
plot(t(1:40),x_noisy(1:40),'k')
hold on 
plot(t(1:40),x(1:40),'r')
legend('x(t)+noise','x(t)')
title('Signals');

figure
plot(t,x_noisy,'k')
hold on 
plot(t,x,'r')
legend('x(t)+noise','x(t)')
title('Signals');
hold on

figure 
PlotSpectrum(x_noisy,fs);
title('Spectrum of the singnal+noise before filting');
figure
plot(t,x,'r')

hold on 
plot(t,x,'b')
xlabel('t [s]')
legend('x(t):original sinusiod','y(t):outputof the filter')
title('Signals');

hold on
Nf=400; % Number of FIR filter taps

%% *Low pass filter design *
Fpass=2000; % 3dB cut frequency
h_lowpass=fir1(Nf, Fpass/(0.5*fs)); % filter design 

%% *Filter impluse response and frequency respond (transfer function)*
stem(h_lowpass) %filter taps (coefficients), that is ,filter impluse resopnse 
title('Low pass filter: impluse response')
freqz(h_lowpass,1,[],fs); % plot the frequency response
title('Low pass filter: frequency response')

%% *Passband filter design*
Fpass1=800; % low cut frequency of the filter 
Fpass2=1200; % hign cut frequenct of the filter 
h_bandpass=fir1(Nf, [Fpass1/(0.5*fs) Fpass2/(0.5*fs)],'bandpass');% filer design 

%% *filter impluse response and frequency response (transfer function)*
stem(h_bandpass) % filter taps (coefficients), that is, filter impulse response 
title('Bandpass filter: impulse response')
freqz(h_bandpass,1,[],fs); %plot the frequency resionse
title('Bandpass filter: frequency response')

%% *Filtering*
y=conv(x_noisy,h_bandpass,'same'); % filter the singal with the bandpass filter
%y=conv(x_noise,h_lowpass,'same'); % filter the singal with the lowpass filter

%% *Plots*
figure 
PlotSpectrum(y,fs);
title('Spercrum of the singal after filtering');

figure
plot(t,x,'r')

hold on 
plot(t,y,'b')
xlabel('t [s]')
legend('x(t):original sinusiod','y(t):outputof the filter')
title('Signals');

figure 
plot(t,y,'b')
hold on 
plot(t,x_noisy,'k')
xlabel('t [s]')
legend('y(t): output of the filter','x(t)+noise :input of the filter')
title('Signals')














