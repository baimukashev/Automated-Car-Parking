% plot the input u1 and u2
function px = plot_input(u)
subplot(2,1,1)
plot(u(1:20,1))
title('Input u1')
subplot(2,1,2)
plot(u(21:40,1))
title('Input u2')
end