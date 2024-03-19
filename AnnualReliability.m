% Calculation of annual reliability level considering different NTM cases and a linearized limit state function using (FORM)
% The cases must change in each run due to the component or case of interest
clear;
clc;
%E=40
syms logDelta logK logDEL X
X=[logDelta, logK, logDEL];
  Ann_rel=zeros(10,20);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% blade:
%  logDelta_dist=makedist('Normal','mu',-0.1116,'sigma',0.4724);%cov=0.5, blade
% % 
% % % m=8;
%    logK_dist=makedist('Normal','mu',28.38,'sigma',0.528);%composite
% %  logDEL_dist=makedist('lognormal','mu',0.822,'sigma',0.005); % case1 - Constant turb
% %  logDEL_dist=makedist('lognormal','mu',0.795,'sigma',0.003); % case2- lognormal turb
%    logDEL_dist=makedist('lognormal','mu',0.780,'sigma',0.003); % case3 - Weibul turb
% % 
% % m=10,f=1hrz.
%  logK_dist=makedist('Normal','mu',31.04,'sigma',0.528);%composite
% logDEL_dist=makedist('gev','k',-0.299,'sigma',0.012,'mu',2.405); %% case1 - Constant turb
% logDEL_dist=makedist('gev','k',-0.239,'sigma',0.006,'mu',2.349); % case2- lognormal turb
% logDEL_dist=makedist('normal','mu',2.323,'sigma',0.007); % case3 - Weibul turb
%  
% %m=12
% logK_dist=makedist('Normal','mu',33.85,'sigma',0.528);%composite
% logDEL_dist=makedist('normal','mu',2.510,'sigma',0.013); % case1 - Constant turb
%logDEL_dist=makedist('normal','mu',2.457,'sigma',0.007); % case2- lognormal turb
% logDEL_dist=makedist('normal','mu',2.434,'sigma',0.009);  % case3 - Weibul turb

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Tower:
 logDelta_dist=makedist('Normal','mu',-0.0431,'sigma',0.2936);% cov=0.3, tower 
% 
logK_dist=makedist('Normal','mu',25.6,'sigma',0.2);%steel 
logDEL_dist=makedist('lognormal','mu',1.11,'sigma',0.01);  % case1 - Constant turb
% %logDEL_dist=makedist('Normal','mu',-0.5692,'sigma',0.0234); %case2- lognormal turb normal 	
% logDEL_dist=makedist('Normal','mu',-0.7628,'sigma',0.009); % case3 - Weibul turb

% m=4,fr=1hz
% logK_dist=makedist('Normal','mu',29.32,'sigma',0.2);%steel
% logDEL_dist=makedist('Normal','mu',-0.302,'sigma',0.013);% case1 - Constant turb
% logDEL_dist=makedist('Normal','mu',-0.307,'sigma',0.027); % case2- lognormal turb
% logDEL_dist=makedist('Normal','mu',-0.496,'sigma',0.010);  % case3 - Weibul turb
	 
% m=5,fr=1hz
% logK_dist=makedist('Normal','mu',29.51,'sigma',0.21);%steel
% %logDEL_dist=makedist('Normal','mu',-0.126,'sigma',0.014);%steel
% %  logDEL_dist=makedist('normal','mu',-0.103,'sigma',0.032); %case1 - Constant turb
%  logDEL_dist=makedist('normal','mu',-0.294,'sigma',0.011); % case3 - Weibul turb


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Tower Siemens
% m=3,fr=1hz
%  logK_dist=makedist('Normal','mu',23,'sigma',0.2);%steel
% logDEL_dist=makedist('gev','k',-0.27,'sigma',0.02,'mu',0.59); %case1 - Constant turb
% logDEL_dist=makedist('normal','mu',0.38,'sigma',0.02);% case3- Weibull turb


% m=4,fr=1hz
% logK_dist=makedist('Normal','mu',23.6,'sigma',0.2);%steel
% %logDEL_dist=makedist('normal','mu',0.84,'sigma',0.01); %case1 - Constant turb
%  logDEL_dist=makedist('normal','mu',0.65,'sigma',0.02); % case3 - Weibul turb

DIST=[logDelta_dist,logK_dist,logDEL_dist];

X0=[-0.04, 25.6, 2.9];
for i=1:20
g=limitstate(X,i);
[u_standard, IMPORTANCE, beta_final, p_f]=FORM(g,X,DIST,X0);
Ann_rel(1:8,i)=[u_standard';IMPORTANCE';beta_final;p_f];
if i>1
Ann_rel(9,i)=(Ann_rel(8,i)-Ann_rel(8,i-1))/(1-Ann_rel(8,i-1));
Ann_rel(10,i)=-norminv(Ann_rel(9,i));
end
end
save('Ann_rel_tower_m3.mat','Ann_rel')
