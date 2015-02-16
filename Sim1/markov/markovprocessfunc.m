function xdot=markovprocessfunc(t,x);

% Solves the Markov process with the generator A = B'

global B;

%	Note that xdot and x are column vectors
xdot = B*x;
