%Sampling 20 data points from probability distribution of turbulence considering IEC Ed. 4 NTM model (full distribution)
%example of Iref=0.1 is shown, Iref may change based on preference
clc;
clear;
% randnumbers=rand(12,20);
% randomcdf=zeros(12,20);
samplecdf=zeros(12,20);
Turb_wbl=zeros(12,20);
TI_wbl=zeros(12,20);

% for jj=1:200
% randomcdf(:,jj)=0.005*(jj-1)+(0.005)*randnumbers(:,jj);
% end

Iref=0.1;

for jj=1:20
samplecdf(:,jj)=0.05*(jj-1)+((0.05)/2);
end

for MWS=1:12
    v=(MWS+1)*2;
    k=0.27*v+1.4;
    scale=Iref*(0.75*v+3.3);

for kk=1:20
    Turb_wbl(MWS,kk)=icdf('Weibull',samplecdf(MWS,kk),scale,k);
    TI_wbl(MWS,kk)=Turb_wbl(MWS,kk)/v;
end
    plot(Turb_wbl(MWS,:),samplecdf(MWS,:),'*');
    hold on
end

% save('Turb_wbl_lowIref.mat','Turb_wbl');
% save('TI_wbl_lowIref.mat','TI_wbl');
