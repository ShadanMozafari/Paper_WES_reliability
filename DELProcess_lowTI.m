%calculation of DEl_lifetime in different NTM cases using Iref=0.1 simulation data_DTU 10MW
% The sources of the data are local and must be updated when running the code
clear;
clc;
delm_wbl=zeros(12,20);
delm_lgn=zeros(12,20);
delm_Iref=zeros(12,1);
m=4;
d1=zeros(1,100);
d2=zeros(1,100);
d3=zeros(1,100);

cd ('C:\Users\shmoz\OneDrive - Danmarks Tekniske Universitet\Codes\Paper 3\Tower\m_4\lowTI');
load('delm_Iref10_Tbase.mat','delm_Iref10');


% for j=1:12
% delm_Iref(j,1)=(mean(delm_Iref10(j,:))).^(1/m);
% end
% figure
% plot(delm_Iref)

load('DELm4lgn_lowTI.mat','DELm4'); 
load('DELm6lgn_lowTI.mat','DELm6');
load('DELm8lgn_lowTI.mat','DELm8');
load('DELm10lgn_lowTI.mat','DELm10');
load('DELm12lgn_lowTI.mat','DELm12');
load('DELm14lgn_lowTI.mat','DELm14');
load('DELm16lgn_lowTI.mat','DELm16');
load('DELm18lgn_lowTI.mat','DELm18');
load('DELm20lgn_lowTI.mat','DELm20');
load('DELm22lgn_lowTI.mat','DELm22');
load('DELm24lgn_lowTI.mat','DELm24');
load('DELm26lgn_lowTI.mat','DELm26');

% 
%  for j=1:20
%     delm_lgn(1,j)=mean(DELm4(:,j));
%     delm_lgn(2,j)=mean(DELm6(:,j));
%     delm_lgn(3,j)=mean(DELm8(:,j));
%     delm_lgn(4,j)=mean(DELm10(:,j));
%     delm_lgn(5,j)=mean(DELm12(:,j));
%     delm_lgn(6,j)=mean(DELm14(:,j));
%     delm_lgn(7,j)=mean(DELm16(:,j));
%     delm_lgn(8,j)=mean(DELm18(:,j));
%     delm_lgn(9,j)=mean(DELm20(:,j));
%     delm_lgn(10,j)=mean(DELm22(:,j));
%     delm_lgn(11,j)=mean(DELm24(:,j));
%     delm_lgn(12,j)=mean(DELm26(:,j));
% end
% figure
% 
% delbin_lgn=delm_lgn.^(1/m);
% bar3(delbin_lgn)

for j=1:100
    delm_lgn(1,j)=mean(DELm4(j,:));
    delm_lgn(2,j)=mean(DELm6(j,:));
    delm_lgn(3,j)=mean(DELm8(j,:));
    delm_lgn(4,j)=mean(DELm10(j,:));
    delm_lgn(5,j)=mean(DELm12(j,:));
    delm_lgn(6,j)=mean(DELm14(j,:));
    delm_lgn(7,j)=mean(DELm16(j,:));
    delm_lgn(8,j)=mean(DELm18(j,:));
    delm_lgn(9,j)=mean(DELm20(j,:));
    delm_lgn(10,j)=mean(DELm22(j,:));
    delm_lgn(11,j)=mean(DELm24(j,:));
    delm_lgn(12,j)=mean(DELm26(j,:));
end
    
load('DELm4Wbl_lowTI.mat','DELm4');
load('DELm6Wbl_lowTI.mat','DELm6');
load('DELm8Wbl_lowTI.mat','DELm8');
load('DELm10Wbl_lowTI.mat','DELm10');
load('DELm12Wbl_lowTI.mat','DELm12');
load('DELm14Wbl_lowTI.mat','DELm14');
load('DELm16Wbl_lowTI.mat','DELm16');
load('DELm18Wbl_lowTI.mat','DELm18');
load('DELm20Wbl_lowTI.mat','DELm20');
load('DELm22Wbl_lowTI.mat','DELm22');
load('DELm24Wbl_lowTI.mat','DELm24');
load('DELm26Wbl_lowTI.mat','DELm26');
% 

% 
%  
 for j=1:100
    delm_wbl(1,j)=mean(DELm4(j,:));
    delm_wbl(2,j)=mean(DELm6(j,:));
    delm_wbl(3,j)=mean(DELm8(j,:));
    delm_wbl(4,j)=mean(DELm10(j,:));
    delm_wbl(5,j)=mean(DELm12(j,:));
    delm_wbl(6,j)=mean(DELm14(j,:));
    delm_wbl(7,j)=mean(DELm16(j,:));
    delm_wbl(8,j)=mean(DELm18(j,:));
    delm_wbl(9,j)=mean(DELm20(j,:));
    delm_wbl(10,j)=mean(DELm22(j,:));
    delm_wbl(11,j)=mean(DELm24(j,:));
    delm_wbl(12,j)=mean(DELm26(j,:));
end

%  for j=1:20
%     delm_wbl(1,j)=mean(DELm4(:,j));
%     delm_wbl(2,j)=mean(DELm6(:,j));
%     delm_wbl(3,j)=mean(DELm8(:,j));
%     delm_wbl(4,j)=mean(DELm10(:,j));
%     delm_wbl(5,j)=mean(DELm12(:,j));
%     delm_wbl(6,j)=mean(DELm14(:,j));
%     delm_wbl(7,j)=mean(DELm16(:,j));
%     delm_wbl(8,j)=mean(DELm18(:,j));
%     delm_wbl(9,j)=mean(DELm20(:,j));
%     delm_wbl(10,j)=mean(DELm22(:,j));
%     delm_wbl(11,j)=mean(DELm24(:,j));
%     delm_wbl(12,j)=mean(DELm26(:,j));
% end
% figure
% delbin_wbl=delm_wbl.^(1/m);
% bar3(delbin_wbl)



digitsOld=digits(50);
% figure
Neq=600;
DEL_wbl=zeros(1,100);
DEL_lgn=zeros(1,100);
DEL_Iref10=zeros(1,100);
% bins=1:12;
% DELbin_ratioWbl=zeros(12,200);
% DELbin_ratiolgn=zeros(12,200);
% DELbin_lgnm=zeros(12,200);

for MWS=1:12
    v=(MWS+1)*2;
    Pw=(exp(-3.14*(((v-1)/20)^2))-exp(-3.14*(((v+1)/20)^2))); 
    
for seed=1:100
DEL_Iref10(1,seed)=Pw*delm_Iref10(MWS,seed)+DEL_Iref10(1,seed);   
DEL_wbl(1,seed)=Pw*delm_wbl(MWS,seed)+DEL_wbl(1,seed);
DEL_lgn(1,seed)=Pw*delm_lgn(MWS,seed)+DEL_lgn(1,seed);
end

% DELbin_ratioWbl(MWS,:)=(delm_wbl(MWS,:).^(1/m))/(mean(delm_Iref16(MWS,:)).^(1/m));
% DELbin_ratiolgn(MWS,:)=(delm_lgn(MWS,:).^(1/m))/(mean(delm_Iref16(MWS,:)).^(1/m));
% hold on
% plot(v,(delm_lgn(MWS,:).^(1/m)/delm_Iref16(MWS,1).^(1/m)),'b o')
% hold on
% DEL_Iref16(1,:)=Pw*delm_Iref16(MWS,:)+DEL_Iref16(1,:);
% plot(v,(delm_wbl(MWS,:).^(1/m)/delm_Iref16(MWS,1).^(1/m)),'r *')
% hold on
end
for k=1:1000
y1=randsample(DEL_Iref10,6);
d1(1,k)=((sum(y1))/6)^(1/m);
y2=randsample(DEL_lgn,6);
d2(1,k)=((sum(y2))/6)^(1/m);
y3=randsample(DEL_wbl,6);
d3(1,k)=((sum(y3))/6)^(1/m);
end
%boxplot((DEL_wbl(1,:).^(1/m))/(mean(DEL_Iref16(1,:).^(1/m))))
figure
%boxplot(DELbin_ratioWbl',bins');
%figure
%boxplot(DELbin_ratiolgn',bins');
%xlabel('Mean wind speed')
%ylabel('DEL ratio')
%s=struct(field,value)
del1=d1/mean(d1);
del2=d2/mean(d1);
del3=d3/mean(d1);
DEL_base=(mean(DEL_Iref10));
%  D_wbl=DEL_wbl/DEL_base;
%   D_lgn=DEL_lgn/DEL_base;
 D_Iref10=DEL_Iref10/DEL_base;
%  plot(DEL_lgn./DEL_Iref16,'b o')
logd1=log(d1);
logd2=log(d2);
logd3=log(d3);
DEL_Iref10=DEL_Iref10.^(1/m);
DEL_wbl=DEL_wbl.^(1/m);
DEL_lgn=DEL_lgn.^(1/m);

% save('DEL_Iref16_blade.mat','DEL_Iref16');
% save('DEL_wbl_blade.mat','DEL_wbl');
% % save('DEL_lgn_blade.mat','DEL_lgn');
