function [W]=iterStat(n,t)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function takes inputs n and t and calculates the evolution of a 2-
% dimensional connection matrix W over time (W is n x n x t).

% Input n is the number of neurons
% Input t is the number of time iterations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialize weight matrix, firing rate vector, and surplus vector
[W,f,s,t] = varInit(n,t);
 
for i=1:t-1
    % returns an n x 1 vector of the convergent firing rate
    % if the firing rate does not converge this function aborts the program
    f = findConvergence(W(:,:,i),f);
    
    % set up array of initial surplus energy values for each neuron
    S = buildSurplus(W(:,:,i),f,s);
    
    %calculate sum of weights for each neuron
    nw = neuronWeight(W(:,:,i));
    
    % update weights
    for j=1:n
        for k=1:n
            % find min(Sj/nw,Sk/nw)
            % tie goes to S(k)/nw(k)
            % a = S(j)/nw(j); b = S(k)/nw(k); %just to watch them in the
            % workspace
            if (S(j)/nw(j) < S(k)/nw(k))
                W(j,k,i+1) = W(j,k,i) + abs(W(j,k,i))*(S(j)/nw(j));
            else
                W(j,k,i+1) = W(j,k,i) + abs(W(j,k,i))*(S(k)/nw(k));
            end
        end
    end
end
return


