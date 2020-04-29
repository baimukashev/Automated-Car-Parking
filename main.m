% This is the main function 
% It solves the OCP problem and at the end simulates the car parking
clear all; clc;
theta = 0;
L = 3;
N = 20;
% input 
v = 0;
psi = 0;
% equations
px = v*cos(theta);
py = v*cos(theta);
dtheta = v*tan(psi)/L;
% states
% x = [px py theta];
% initial and final state
x0 = [0 2 0.01];
xf = [0 0 0];
% obtain constraints
[u0,A,b,Aeq,beq,lb,ub] = bd(x0);

% objective func
cost = @(u)obj(u);
% nonlinear constraint
nonlcon = @(u)nonlin(u);
% optionsx
options = optimoptions('fmincon','Algorithm','sqp'); %  
options = optimoptions(options, 'OptimalityTolerance', 1e-3, 'StepTolerance',1e-3, 'ConstraintTolerance',1e-3, 'MaxFunctionEvaluations', 10000); 
% calculate optimal input
U = fmincon(cost,u0,A,b,Aeq,beq,lb,ub,nonlcon,options);
x = dk(U);
disp('Finished the calculation')
% plotting the input and state variables / simulate the car movement
figure(1)
plot_state(x)
figure(2)
plot_input(U)
figure(3)
simulation_parking(x)