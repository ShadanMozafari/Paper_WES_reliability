clc;
clear;

% E_turb=26.26;
% Sigma_turb=0.528;
% mu=log(E_turb^2/sqrt(Sigma_turb^2+E_turb^2));
% sigma=sqrt(log((Sigma_turb^2/E_turb^2)+1));

%s:std of normal m: mu of normal,   S:std of lognormal, M:mu of lognormal
s=0.528;
m=29.44;
M=exp(m+(s^2/2));
S=sqrt((exp(s^2)-1)*(exp(2*m+s^2)));



