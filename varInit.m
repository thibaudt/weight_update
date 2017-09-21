function [W,f,s,t]=varInit(n,t)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function initiates the variables needed to compute the evolution
% of the connection matrix W over time. W is an n x n x t connection matrix,
% s is a 1 x n array holding the values of surplus energy for any neuron,
% and f is the firing rate vector, but is n x N because we iterate across
% N until f converges. t is the number of iterations of the evolution of W
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% N is the number of iterations to let f converge
N = 200;

x=randn(1,n);
s=zeros(1,n);

% if x(i) is negative all the connections of neuron are -1 (inhibitory neuron)
% if x(i) is positive all the connections of neuron are 1 (excitatory neuron)
%{
for i=1:n
    if (x(i)<0)
        x(i)=-1;
    else
        x(i)=1;
    end
end
%}

% instead, using sign(x) does the same, except when x(i) = 0, it stays 0
a = sign(x);

Wo=ones(n,1)*a;
f=zeros(n,N);


% is this loop necessary? i.e. shouldnt all diag(W) be 0?
for i=1:n
    Wo(i,i) = 0;
end

% expand W into time; set up initial W for t.initial
W = zeros(n,n,t);
W(:,:,1) = Wo;

