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

