% Markovchain
%  Propagation of a Markov chain having m states 
%  The chain propagates 10 time steps
%  Ulf Jeppsson, January 2009

% Initialize X and t
t = 0;
X = 0;

% Make a new simulation with the same P matrix?
disp(' ')
disp('Automation 2009, Markov chains')
disp(' ')
yes = input('Keep the old P matrix? (yes=1, no=0)   ');
disp(' ')

if yes>0.9
    P
    m = size(P,1);
else
%    m = input('Number of states =  ');
%    disp(' ')
    disp('Provide the P matrix (on the form [ x x .. ;  x ...], or give the name of a predefined matrix in the Matlab workspace)')
    P = input('P = ')
    m = size(P,1);
end

%define the initial condition p(0) (a row vector)
p = input('Define initial condition, p(0) (row) vector (on the form [ x x .. ]) ');


% The probability transition matrix P is transposed to a matrix A 
    A=P';
% The row vector p is transposed to a column vector z
    z=p';
    
%The initial conditions define the first column of a matrix X

    for i=1:m
        X(i,1)=z(i);
    end
    
% 10 state transitions (time steps) are computed
for k=1:10
z=A*z;
for i=1:m
X(i,k+1)=z(i);
end 
end

% Generate a time-step vector 
for k=1:11
    t(k)=k-1;
end

% Plot the curves
probability_vector_at_time_10 = z'
 plot (t,X, 'o:');
 % grid on;
 xlabel('Time step')
 ylabel('Probability')
 if m==2
    legend('s1', 's2', 0)
end
if m==3
    legend('s1', 's2','s3', 0)
end
if m==4
    legend('s1', 's2','s3', 's4', 0)
end
if m==5
    legend('s1', 's2','s3', 's4', 's5', 0)
end
if m==6
    legend('s1', 's2','s3', 's4', 's5', 's6', 0)
end
 title('Markov chain')
  
 a = (eye(m,m)-P);
 a = a';
 a(m,:) = 1;
 b = zeros(m,1);
 b(m)=1;
 c = a\b;
 stationary_solution_vector = c'
 
 P_power_100 = P^100;
 P_power_101 = P^101;
 P_power_102 = P^102;

 P_raised_to_100 = P_power_100
 P_raised_to_101 = P_power_101
 P_raised_to_102 = P_power_102
 eigenvalues_of_P = eig(P)'
 