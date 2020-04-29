% this function returns the values to be used in fmincon function, and
% initial input guesses, upper and lower bounds
function [u,A,b,Aeq,beq,lb,ub] = bd(x0)
N = 20;
tf = 20;
dt = tf/N;
x = zeros(N, 3);
u = zeros(2*N,1);

% random input for system
for i = 1:N
    rng(i) % this gives the predicted random variable. If commented, the solver gives different solution every time
    ur = rand(1,2);
    u(i,1) = ur(1)-0.5;
    u(i+10,1) = 0.66* (ur(2)-0.5);
end

% equation;
A = [];
b = [];
Aeq = [];
beq = [];

% upper & lower limits
lb = zeros(2*N,1);
ub = zeros(2*N,1);

for i = 1:N
    lb(i,1) = -0.5;
    lb(i+10,1) = -0.33;
    ub(i,1) = 0.5;
    ub(i+10,1) = 0.33;
end

end