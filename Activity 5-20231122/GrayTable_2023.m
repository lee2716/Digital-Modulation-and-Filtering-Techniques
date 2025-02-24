% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************
function table=GrayTable_2023(nlevels)
% By Giovanni Preziosi (AA 2023/2024)

%nbits=1000;
%x=randi([0,1],nbits,1);
bit_comb=dec2bin(0:nlevels-1)-'0'; %generate all possible nlevels combination of log2(nlevels) bits
for i=1:nlevels
    bit_comb_encoded(i,:)=bin2gray_Custom(bit_comb(i,:)); %gray encoder
end 
%y = bin2gray(x,nlevels); %%this function is no more present in Matlab2023

table=zeros(nlevels,log2(nlevels)+1);
for jj=1:nlevels
    %A(jj,:)= dec2base(map(jj),2,log2(nlevels));
    table(jj,1:log2(nlevels))=bit_comb_encoded(jj,:); %associate each sequence of gray bits 
    table(jj,log2(nlevels)+1)=2*jj-1-nlevels; % with one symbol of the possible L symbols
end