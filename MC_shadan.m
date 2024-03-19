% Monte Carlo simulations for finding the probability of failure at year i - all the numbers are assume levels and are changed
clear;
clc;
n = 1e8;
Neq=600*6*24*365*i;
counter=0;
digitsOld = digits(50);
%  g=zeros(n,1);
%g1=zeros(n,1);
%  for ii=1:10
  tic
% Pf_blade
m=10;
c=1.9/2;
I=4.837;
H=c/I;

for ii=1:10

Delta=lognrnd(-0.111,0.4724,n,1); 

% m=8
% K=lognrnd(28.00,0.5,n,1);
% DEL=normrnd(9.83,0.0999,n,1);%case 1
% DEL=gevrnd(-0.1204,0.1213,3.16,n,1);%case 2
% DEL=gevrnd(0.01251,0.0707,3.235,n,1);%case 2

% m=10
K=lognrnd(31.04,0.528,n,1);
% DEL=gevrnd(0.59,8.89,18.16,n,1);%EXTRAPOLATION
DEL=normrnd(11.120,0.129,n,1);%case1
% DEL=gevrnd(0.00004667,0.08655,3.769,n,1);%case2
% DEL=gevrnd(-0.2929,0.1636,8.625,n,1);%case3

%m=12
%  K=lognrnd(33.64,0.528,n,1);
%  DEL=normrnd(12.46,0.154,n,1);%case 1
% DEL=gevrnd(-0.205,0.09423,11.79,n,1);%case 2
% DEL=gevrnd(0.3249,0.1006,4.575,n,1);%case 2

% Pf_tower
m=3;
c=4.15/2;
I=8.416;

% Pf_tower siemens
% m=4;
% c=0.316;
% I=0.686;

% H=c/I;
%  Delta=lognrnd(-0.0431,0.2936,n,1); 
% % 
% %m=3
%  K=lognrnd(25.65,0.2,n,1);
%  DEL=lognrnd(3.02,0.02127,n,1);%m3,case1
%  DEL=gevrnd(-0.3064,0.01328,7.336,n,1);%m5,case2
%  DEL=gevrnd(-0.06746,0.2436,6.916,n,1);%m5,case3

% m=4
% K=lognrnd(25.146,0.2,n,1);
% DEL=lognrnd(3.241,0.023,n,1);%m3,case1
%   DEL=gevrnd(-0.127,0.2888,10.87,n,1);%m3,case2
%   DEL=gevrnd(-0.0498,0.3802,10.59,n,1);%m3,case3

% %m=3 siemens
%     K=lognrnd(17.146,0.2,n,1);
%     DEL=gevrnd(-0.27,0.02,0.59,n,1);%m3,case1
%    DEL=normrnd(0.38,0.02,n,1);%m3,case3

% %m=4 siemens
%  K=lognrnd(17.5,0.2,n,1);
% %  DEL=normrnd(0.84,0.01,n,1);%m4,case1
%  DEL=normrnd(0.65,0.02,n,1);%m4,case3

%sensitivity-tower:
% k=219696;
% del=10.59; %Reliability Iref 0.16
% logDelta=normrnd(-0.111,0.4724,n,1);
% logK=normrnd(26.626,0.602,n,1);
% logDEL=gevrnd(-0.285,0.059,1.309,n,1);
% vi_delta=var(Delta);
% g=zeros(n,1);

for i=1:n
g= Delta(i)-(Neq*((DEL(i))^m)*(H^m)/K(i));

  if g<0
     counter=counter+1;
  end
end
%  if g1<0
%   counter1=counter1+1
 toc
end
 P_fail=vpa(counter/n/10)
% vi_delta=var(g1);
% vi_del=var(g1);
% V=var(g);
% sensitivity=vi_del/V;
% scatter(Delta,g);
