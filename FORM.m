%function used for estimation of annual reliability index based on FORM- in case of non-normal distributions transformation is done
function [u_standard, IMPORTANCE, final_beta, p_f] = FORM(g, var, dist, init_point)
point = init_point; 
max_iteration = 30;                      
counter = 1;                     
beta = ones(1,max_iteration);            
dg = gradient(g, var);

while true
  %transforming non-normal distributions to standrad normal
    j = 0;
    for i=1:1:length(dist)
        if strcmp(class(dist(i)),class(makedist('Normal')))==0
            j = j + 1;
            Transformed_normal(j)=Transformation(dist(i), point(i));
        end
    end
    N_mu = ones(1, length(dist));  
    N_std   = ones(1, length(dist));
    jj = 0;   
    for i=1:1:length(dist)
        if strcmp(class(dist(i)),class(makedist('Normal')))==1
            N_mu(i) = mean(dist(i));
            N_std(i)   = std(dist(i));
        elseif strcmp(class(dist(i)),class(makedist('Normal')))==0
            jj = jj+ 1;
            N_mu(i) = mean(Transformed_normal(jj));
            N_std(i)   = std(Transformed_normal(jj));
        end
    end
    new_design_point_standard=(point-N_mu)./N_std;
    design_point_standard=new_design_point_standard;
    derivate = double(subs(dg,var,point));
    partial_derivate = derivate'.*N_std;

    esc1 = 1/sum(partial_derivate.*partial_derivate);
    esc2 = sum(partial_derivate.*design_point_standard) - double(subs(g,var,point));
    esc3 = esc1 * esc2;
    new_design_point_standard = esc3*partial_derivate;
    beta(counter+1) = norm(new_design_point_standard);
    newpoint = new_design_point_standard.*N_std + N_mu;
    g1 = double(subs(g,var,newpoint));
    
    point = double(newpoint);
    %Convergence
    if (abs(beta(counter+1) - beta(counter))<=0.001) && (abs(g1)<=0.001)
        break;        
    else
        counter=counter+1;
    end
end

final_beta   = beta(counter+1);           
alpha=new_design_point_standard/beta(counter+1);
IMPORTANCE=(alpha.^2);
u_standard = new_design_point_standard;
n_iterations = counter;                    %number of iterations    
p_f = normcdf(-final_beta);        
fprintf('Iterations #: %g\n %g\n  %g\n %g\n  %g\n %g\n', n_iterations, final_beta, p_f,IMPORTANCE);
return
