%Nonnormal distribution to normal distribution: Normal-tail approximation [Rackwitz, R. and Fiessler, B.: Non-normal vectors in %structural reliability, 1978]

function [obj_normal] = Transform(obj_dist, x)
v=cdf(obj_dist, x);
p=pdf(obj_dist, x);
if v==1
   v=v-0.00001;
   p=p+0.00001;
elseif v==0
    v=v+0.00001;
    p=p-0.00001;
end

sigma_N = normpdf(norminv(v))/(p); %computing std
mu_N  = x- norminv(v)*sigma_N    ;           %computing mean
obj_normal = makedist('Normal', 'mu', mu_N, 'sigma', sigma_N); 
return
