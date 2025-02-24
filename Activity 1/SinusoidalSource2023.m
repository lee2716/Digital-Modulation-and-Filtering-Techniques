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


function [t, x,N]=SinusoidalSource_2023(A, f0, T,fs)
%A: ampliyude of tyhe sinusiod 
%f0: frequency of the sinusoid 
%T: duration(sec£©
%fs: sampling frequency

Ts=1/fs; % sampling time
t=0:Ts:T; % sampled time axis
x=A*cos(2*pi*f0*t); % generation of the sinusoid sampleds
N=length(x); % Number of samples of signal

end

