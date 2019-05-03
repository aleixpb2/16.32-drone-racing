% GPOPS-II solution
close all; clc

solution = output.result.solution;

%%
figure;
hold on
plot(solution.phase(1).time, solution.phase(1).state(:,1))
plot(solution.phase(2).time, solution.phase(2).state(:,1))
plot(solution.phase(3).time, solution.phase(3).state(:,1))
title('Position vs time')
xlabel('t'), ylabel('x')
%%
figure;
hold on
plot(solution.phase(1).time, solution.phase(1).state(:,2))
plot(solution.phase(2).time, solution.phase(2).state(:,2))
plot(solution.phase(3).time, solution.phase(3).state(:,2))
title('Velocity vs time')
xlabel('t'), ylabel('v')
%%
figure;
hold on
plot(solution.phase(1).time, solution.phase(1).control)
plot(solution.phase(2).time, solution.phase(2).control)
plot(solution.phase(3).time, solution.phase(3).control)
title('Control vs time')
xlabel('t'), ylabel('u')
