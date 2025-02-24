% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************
function [codedbits] = HammingCoder_2023(source_bits)
G=[1,0,0,0,1,1,0;0,1,0,0,1,0,1;0,0,1,0,0,1,1;0,0,0,1,1,1,1];
bits_matrix=reshape(source_bits,4,[]);

codewords_matrix=mod(bits_matrix'*G,2);
codedbits=reshape(codewords_matrix',1,[]);
end