% this function is nonlinear constraints that will be used in fmincon
% function
function [c,ceq] = nonlin(u)
N=20;
x = dk(u);
sigma = 1.2;
c = zeros(6*N,1);
% final state values
ceq(1) = x(20,1);
ceq(2) = x(20,2);
ceq(3) = x(20,3);
% nonlinear constraints to avoid the overlapping of two circles,
% so that car does not hit the obstacle(other cars)
% there are 6 = 2*3 equations
for i = 1:N
    c(i) = -(x(i,1) - sigma*cos(x(i,3)) + 3.5)^2 -  (x(i,2)-sigma*sin(x(i,3))-0)^2 + 4;
    c(i+10) = -(x(i,1) - sigma*cos(x(i,3)) - 3.5)^2 -  (x(i,2)-sigma*sin(x(i,3))-0)^2 + 4;
    c(i+20) = -(x(i,1) + sigma*cos(x(i,3)) + 3.5)^2 -  (x(i,2)+sigma*sin(x(i,3))-0)^2 + 4;
    c(i+30) = -(x(i,1) + sigma*cos(x(i,3)) - 3.5)^2 -  (x(i,2)+sigma*sin(x(i,3))-0)^2 + 4;
    c(i+40) = -(x(i,1) - 3.5)^2 - (x(i,2)-0)^2 + 4;
    c(i+50) = -(x(i,1) + 3.5)^2 - (x(i,2)-0)^2 + 4;
end

end