% cost function
% function f = obj(u)
% x = dk(u);
% s = 0 ;
% N = 20;
% for i = N:N
%     s = s + x(i,1)^2 + x(i,2)^2 + x(i,3)^2;
% end
% f = s;
% end

% As a objective function I have tried only Lagrange, and only Mayer, and
% also both of them
% objective function Mayer term and Lagrange
function f = obj(u)
s = 0 ;
N = 20;
for i = 1:N
    s = s + u(i,1)^2 + u(i+20,1)^2;
end
x = dk(u);
for i = N:N
    s = s + x(i,1)^2 + x(i,2)^2 + x(i,3)^2;
end

f = s;
end

