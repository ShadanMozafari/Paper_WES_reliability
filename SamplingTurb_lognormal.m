clc;
clear;
Iref=0.1;
samplecdf=zeros(12,20);
TI_lgn=zeros(12,20);
Turb_lgn=zeros(12,20);

for jj=1:20
samplecdf(:,jj)=0.05*(jj-1)+((0.05)/2);
end

for MWS=1:12
    v=(MWS+1)*2;
    E_turb=Iref*(0.75*v+3.8);
%   Sigma_turb=Iref*(0.27*v+1.4);
    Sigma_turb=Iref*(1.4);
    mu=log(E_turb^2/sqrt(Sigma_turb^2+E_turb^2));
    sigma=sqrt(log((Sigma_turb^2/E_turb^2)+1));

for kk=1:20
    Turb_lgn(MWS,kk)=icdf('lognormal',samplecdf(MWS,kk),mu,sigma);
    TI_lgn(MWS,kk)=Turb_lgn(MWS,kk)/v;
     
end
plot(Turb_lgn(MWS,:),samplecdf(MWS,:),'o')
hold on
end

save('Turb_lgn_lowIref.mat','Turb_lgn');
save('TI_lgn_lowIref.mat','TI_lgn');

