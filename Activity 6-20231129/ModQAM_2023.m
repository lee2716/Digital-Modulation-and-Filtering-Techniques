% Written by Davide Dardari and Gianni Pasolini- University of Bologna -
% 2015/2023
%
function s = ModQAM_2023(xI,xQ,fc,T,fs)
% Generates a quadrature modulated signal
% xI: in phase signal samples
% xQ: in quadrature signal samples
% fc: carrier frequency  (fc<fs/2)
% fs: sampling rate
% T: duration (sec)

Ts=1/fs;  % Sampling time
t=0:Ts:T; % Sampled time axis
s=xI.*cos(2*pi*fc*t)-xQ.*sin(2*pi*fc*t);
end

