% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************


function [Xi,Xq,Delay] = DeModQAM_2023(s,fc,T,fs,psi)
% design a low-pass FIR filter with cut frequency ft=fc/2 and Nf taps
Nf=160; % number of FIR filter taps
b=fir1(Nf-1, fc/2/(fs/2));
% definition of the time axis

Ts=1/fs; % Sampling time
t=0:Ts:T; % Sampled time axis

Xi=2*s.*cos(2*pi*fc*t+psi)
Xq=-2*s.*sin(2*pi*fc*t+psi)

% multiply s(.) for the in-phase and in-quadrature versions of the carrier
% thus getting the (unfiltered) signals Xi and Xq
% (don't forget to multiply the carriers by the factor 2)
% Filter the two signals with the low-pass FIR filter whose coefficients
% have been computed before (vector b)
Xi=conv(Xi,b,'same'); % filter the 2*fc component
Xq=conv(Xq,b,'same');
% compute the delay introduced by the filter (in samples)
Delay=round((Nf-1)/2);
end