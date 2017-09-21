function [fcolumn]=findConvergence(W,f)

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
n = size(W,1);


% r is a vector of randomly generated initial conditions
% r has rows equal to rows of W
r=randn(n,1);

fcolumn = zeros(n,1);

% we iterate for solution to f = g(w*f + r)
% g = tanh(v)
for i=1:length(f)-1
   v=W*f(:,i)+r;
   f(:,i+1)=alpha*f(:,i)+(1-alpha)*(1+tanh(v))/2;
   e = abs(minus(f(:,i),f(:,i+1)));      %abs(col of f - next col of f)
   e = sum(e)/length(W);                          %error = avg error
   if (e < error)
       plot(f')
        fcolumn = f(:,i);
        return;
   end
end


% if f does not converge, plot it and give error
plot(f');
warning ('f did not converge properly');
