% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************
function [bits] = HammingHardDecoder_2023(codedbits)
n=7; % codeword length
k=4; % data length
comb=2^k; % number of possible codewords
% Code generator matrix
G=[1,0,0,0,1,1,0;0,1,0,0,1,0,1;0,0,1,0,0,1,1;0,0,0,1,1,1,1];
% construct the table with all the codewords
x=de2bi(0:comb-1);
for ii=1:comb
    table(ii,:)=mod(x(ii,:)*G,2);
end
bits=[];
Number_of_codewords=length(codedbits)/7;
received_codewords=reshape(codedbits,7,[]);
for counter=1:Number_of_codewords
    codeword=received_codewords(:,counter);
    hamming_distance=n*pdist2(codeword',table,'hamming');
    [min_value, row_with_minimum_distance]=min(hamming_distance);
    bits=[bits table(row_with_minimum_distance,1:4)];
end
end