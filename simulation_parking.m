% this function simulates the final simulation of the car
function p = simulation_parking(x)
for i = 1:20
    clf
    xlim([-5 5])
    ylim([-3 5])
    car_plot(x(i,1),x(i,2),x(i,3));    
    pause(0.3)
end
end