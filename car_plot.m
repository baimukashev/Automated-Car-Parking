% this function plot the single simulation of the car parking i.e. at
% each time instant. At each instant the two cars as obstacle are shown, 
% then the main car consisting from three circles are drawn.
function f = car_plot(px, py,theta)
sigma = 1.20;
r = 1;

% main car
circle(px - sigma*cos(theta), py-sigma*sin(theta),r);
circle(px, py,r);
circle(px + sigma*cos(theta), py+sigma*sin(theta),r);
% other cars
circle(-3.5, 0,r);
circle(3.5, 0,r);

end