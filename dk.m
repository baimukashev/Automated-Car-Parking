% this function gives the forward simulation of the state variables and
% discretizes the sistem
function [x] = dk(u)
N = 20;
tf = 20;
dt = tf/N;
x = zeros(N, 3);
x0 = [0 2 0.01];

%discretize
x(1,:) = x0;
for i = 2:N
    x(i,:) = x(i-1,:) + dt*[u(i-1,1)*cos(x(i-1,3)) u(i-1,1)*sin(x(i-1,3)) u(i-1,1)*u(i+10,1)];
end

end


