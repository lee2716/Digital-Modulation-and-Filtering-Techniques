% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************
function gray=Encoder_2023(source_bits, nlevels)
k=log2(nlevels); % number of bits corresponding to one symbol
table=GrayTable_2023(nlevels); % table with the correspondence between bits and symbols.
bit_table=table(1:end, 1:end-1)
symbol_table=table(1:end, end)
symbol_index=1;
for i=1:k:length(source_bits)
bits=source_bits(i:i+k-1); % selection of k bits at a time
I = ismember(bit_table, bits,'rows');
row=find(I==1);
gray(symbol_index)=symbol_table(row); % selection of the symbol
symbol_index=symbol_index+1;
end