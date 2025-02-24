function [t,x,N]=SinusoidalSource_2023(A, f0, T,fs)
Ts=1/fs;
t=0:Ts:T;
x=A*cos(2*pi*f0*t);
N=length(x);
end

