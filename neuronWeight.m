function nw = neuronWeight(W)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function takes the connection matrix W as a 2 dimensional matrix
% and sums each respective row and column into a single entry in an array.
% Then the array entries represent the sum of all weights for a single
% neuron.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = size(W, 1);

% take absolute value of W
W = abs(W);

% array of scalars, the ith entry is the sum of all weights entering and
% exiting neuron i. This sums a row vector of column sums and a column
% vector of row sums.
nw = sum(W) + sum(W');


% assert nw is correct size.
if(length(nw) == n)
    return
else
    error('nw wrong size')
end

