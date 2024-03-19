function g = limitstate(X,i)
    Neq=600*6*24*365*i;
    %blade
% m=8;
% c=1.9/2;
% I=4.837;

% %  tower
m=3;
c=4.15/2;
I=8.416;
% c=2.07;
% I=29.12;

%  tower siemens
% m=3;
% c=0.316;
% I=0.686;


H=c/I;
g=(X(1))-log(Neq)+X(2)-m*(X(3))-m*log(H);
% g= (X(1))-((Neq)*((X(3))^m)*(H^m)/(X(2)));
end