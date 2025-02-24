% ************************************************************************
% Author: CONG LI
% Date Created: 2023
%
% This script is part of a course project for 
% Communication Systems: Theory and Measurement M
% at University of Bologna.
% ************************************************************************
function table=GrayTable(nlevels)

nbits=1000;
x=randi([0,1],nbits,1);

[y,map] = bin2gray(x,'pam',nlevels);

table=zeros(nlevels,log2(nlevels)+1);
for jj=1:nlevels
    A(jj,:)= dec2base(map(jj),2,log2(nlevels));
    table(jj,1:log2(nlevels))=sprintf('%s',A(jj,:))-'0';
    table(jj,log2(nlevels)+1)=2*jj-1-nlevels;
end