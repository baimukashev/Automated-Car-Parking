% plot the states
function px = plot_state(x)
subplot(3,1,1)
plot(x(:,1))
title('State x')
subplot(3,1,2)
plot(x(:,2))
title('State y')
subplot(3,1,3)
plot(x(:,3))
title('State theta')
end