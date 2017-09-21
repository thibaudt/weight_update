function [s] = buildSurplus(W,f,s)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function constructs a vector from scratch. For each neuron n, it
% calculates its "surplus energy" from the formula:
%               Surplus = Energy + Energy in - Energy out
% where Energy is a constant, and Energy in and Energy out are calculated
% by multiplying the appropriate column or row of W with the firing rate
% for the appropriate neuron.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = size(W,1);
for i=1:n
    Ein = dot(W(i,:),f');
    Eout = dot(W(:,i),f);
    s(i) = 1 + Ein + Eout;
    if(s(i) < 0)
        s(i) = 0;
    end
end

% if s is wrong size give error
if(length(s) == n)
    return
else
    error('S wrong size')
end