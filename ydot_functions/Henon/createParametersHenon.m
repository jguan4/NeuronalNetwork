function [P]=createParametersHenon(varNum)
%A=buildGrid(sqrt(varNum));
% A=[1];
%%constants
P=zeros(2,varNum);
P(1,:)=2+0.1*rand(1,varNum);
P(2,:)=0.4+0.1*rand(1,varNum);