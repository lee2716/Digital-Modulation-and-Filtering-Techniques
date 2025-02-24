% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************
% white gaussian noise generator
close all
clear all
clc

N=1000; % number of samples
sigma=2; % generates the same set of random numbers each time

rng(2); % gengrates the same set of randm numbers each time 
x=sigma*randn(N,1);

figure
plot(x)
xlabel('n')
ylabel('x[n]')
grid

figure
histogram(x)
xlabel('x')
ylabel('number of outcomes')
title('WGN')

