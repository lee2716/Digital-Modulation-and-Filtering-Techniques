% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************
% PAM modulator

function [x,h,Delay]=PAMmodulator_2023(symbols,nsps,Nf,pulsetype,rolloff)
% symbols: input symbols
% nsps: samples per symbol time
% Nf: number of filter coefficients
% pulsetype: 'RECT' rectangular NRZ pulse, 'ROOTRAISEDCOSINE' root raised cosine pulse
% rolloff: roll-off factor for root raised cosine pulses

N=length(symbols); % number of symbols 
M=N*nsps; % number of samples of the PAM signal
xz=zeros(1,M); % Generate a row vector filled with zeros, with length M
xz(1:nsps:M)=symbols; % copy the symbols into xz

switch pulsetype
     case 'RECT'
        Nf=nsps; 
        h=ones(1,Nf); % Rect impulse response
     case 'ROOTRAISEDCOSINE'
        h = rcosdesign(rolloff,Nf/nsps,nsps,'sqrt'); %root raised cosine impulse response
     otherwise 
        h=1;
        disp('pulse not supported');
end
x=conv(xz,h); % filter the pulses
Delay=(Nf-1)/2; % delay
end


