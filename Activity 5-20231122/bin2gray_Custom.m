% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************
function g = bin2gray_Custom(b)
%this function makes the conversion between a binary sequence 
%to a Gray encoded binary sequence 
g(1) = b(1);
for i = 2 : length(b)
    x = xor(b(i-1), b(i));
    g(i) = x;
end