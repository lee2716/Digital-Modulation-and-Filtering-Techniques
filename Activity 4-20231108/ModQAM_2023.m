% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************
function s = ModQAM_2023(xI,xQ,fc,T,fs)
% xI: in phase signal samples
% xQ: in quadrature signal samples
% fc: carrier frequency (fc<fs/2)
% fs: sampling rate
% T: duration (sec)
Ts=1/fs; % Sampling time
t=0:Ts:T; % Sampled time axis
% TO DO
% generation of the QAM modulated signal
s=xI.*cos(2*pi*fc*t)-xQ.*sin(2*pi*fc*t);
end