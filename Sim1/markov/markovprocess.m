% Markovprocess
% Main program of the markovprocess simulation
% The system is defined by the generator matrix A
% Ulf Jeppsson, January 2009

global B

% Define the duration of the simulation
disp(' ')
disp('Automation 2009, Markov processes')
disp(' ')
tend = input('Set simulation time =  ');
disp(' ')

% Make a new simulation with the same A matrix?
yes = input('Keep the old A matrix? (yes=1, no=0)   ');
disp(' ')

if yes>0.9
    A
else
    disp('Provide the A generator matrix (on the form [ x x .. ;  x ...], or give the name of a predefined matrix in the Matlab workspace)')
    A = input('A = ')
end
% The generator matrix A is transposed to a matrix B 
B = A';

%define the initial condition p(0) (a row vector)
p = input('Define initial condition, p (row) vector (on the form [ x x .. ]) ');

% The row vector p is transposed to a column vector x0
x0 = p';

%Solve the differential equation
[t,x] = ode45(@markovprocessfunc,[0,tend],x0);

% Plot the results
plot(t,x)
grid on;
xlabel('Time')
ylabel('Probabilities')
m=length(A);
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
title('Markov process')

m = size(A,1);
 aa = A';
 aa(m,:) = 1;
 b = zeros(m,1);
 b(m)=1;
 c = aa\b;
 stationary_solution_vector = c'
 
 e_raised_to_A_times_1000 = expm(A*1000)
 eigenvalues_of_A = eig(A)'

