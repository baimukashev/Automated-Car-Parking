function [cost,x0,A,b,Aeq,beq,lb,ub,fx] = func()

N = 10;
tf = 10;
dt = tf/N;

x = zeros(N, 3);
x0 = [0 2 0.01];

u = zeros(N,2);

% random input for system
%rng(5);
for i = 1:N
    ur = rand(1,2)
    u(i,1) = ur(1)-0.5;
    u(i,2) = ur(2)-0.67;
end

%discretize
x(1,:) = x0;
for i = 2:N
    x(i,:) = x(i-1,:) + dt*[u(i,1)*cos(x(i,3)) u(i,2)*sin(x(i,3)) u(i,1)*u(i,2)];
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
    ub(i,1) = 0.5;
end
for i = N+1:2*N
    lb(i,1) = -0.33;
    ub(i,1) = 0.33;
end

% nonlinear constraint
fx = @(x) -(x(1) - sigma*cos(x(3)) + 3.5)^2 -  (x(2)-sigma*sin(x(3))-0)^2 + 4


% constraint in the car position
% the 2 circles should not overlap
%sigma = 1.2;
% (px - s*cos(theta) + 3.5)^2 +  (py-s*sin(theta)-0)^2 > (1+1) ^2

%(x(1) - sigma*cos(x(3)) + 3.5)^2 +  (x(2)-sigma*sin(x(3))-0)^2 > (1+1) ^2

%fx = @(x)(x(1) - sigma*cos(x(3)) + 3.5)^2 +  (x(2)-sigma*sin(x(3))-0)^2

% X = fmincon(FUN,X0,A,B,Aeq,Beq) minimizes FUN subject to the linear 
% equalities Aeq*X = Beq as well as A*X <= B. 
% (Set A=[] and B=[] if no inequalities exist.)



end