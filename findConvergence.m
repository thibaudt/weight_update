function [fcol]=findConvergence(W,f,r)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% After setting a desired error rate and alpha, this function uses 
% fixed point iteration to see if the firing rate converges- i.e.
% does f(x)=x. The equation used is f = g(W*f +r) where f is an n x 1 
% vector of firing rates, r is an n x 1 vector of random inputs, W is 
% an n x n matrix called connection matrix, and g is tanh.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set desired error and alpha
error = 0.0005;
alpha = 0.95;

e=1;

while e>error
   f(:,2)=f(:,1);
   v=W*f(:,2)+r;
   f(:,1)=alpha*f(:,2)+(1-alpha)*(1+tanh(v))/2;
   delta = abs(minus(f(:,1),f(:,2))./f(:,2));      %relative error
   e = max(delta);      %maximum error                   
end

fcol=f(:,1);
