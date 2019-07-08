% GPOPS-II solution
close all;

solution = output.result.solution;

% Group variables
time_tot = [];
x_tot = []; y_tot = []; z_tot = [];
xgates_tot = []; ygates_tot = []; zgates_tot = [];
time_gates = [];
for i_phase = 1:n_gates
    time_tot  = [time_tot; solution.phase(i_phase).time];
    time_gates = [time_gates; time_tot(end)];
    x_tot     = [x_tot; solution.phase(i_phase).state(:,1)];
    y_tot     = [y_tot; solution.phase(i_phase).state(:,2)];
    z_tot     = [z_tot; solution.phase(i_phase).state(:,3)];   
    xgates_tot = [xgates_tot; gates(i_phase).x];
    ygates_tot = [ygates_tot; gates(i_phase).y];
    zgates_tot = [zgates_tot; gates(i_phase).z];
end

%% Position and velocity
f = figure();
subplot(2,3,1)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,1), 'LineWidth', 1.5)
end
plot(0,0,'*', 'LineWidth', 4)
plot(time_gates, xgates_tot, 'o')
title('x vs t'), xlabel('t'), ylabel('x')
subplot(2,3,2)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,2), 'LineWidth', 1.5)
end
plot(0,0,'*', 'LineWidth', 4)
plot(time_gates, ygates_tot, 'o')
title('y vs t'), xlabel('t'), ylabel('y')
subplot(2,3,3)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,3), 'LineWidth', 1.5)
end
plot(0,0,'*', 'LineWidth', 4)
plot(time_gates, zgates_tot, 'o')
title('z vs t'), xlabel('t'), ylabel('z')
subplot(2,3,4)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,4), 'LineWidth', 1.5)
end
title('v_x vs t'), xlabel('t'), ylabel('v_x')
subplot(2,3,5)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,5), 'LineWidth', 1.5)
end
title('v_y vs t'), xlabel('t'), ylabel('v_y')
subplot(2,3,6)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,6), 'LineWidth', 1.5)
end
title('v_z vs t'), xlabel('t'), ylabel('v_z')

% 3D plot
f = figure();
plot3(x_tot, y_tot, z_tot, 'LineWidth', 1.5)
hold on
scatter3(0,0,0, '*','LineWidth', 7); % start
scatter3(xgates_tot, ygates_tot, zgates_tot, 'LineWidth', 2);
tmpAspect=daspect();
daspect(tmpAspect([1 1 1]))
xlabel('x'), ylabel('y'), zlabel('z')
grid on

%% Orientation and rates
f = figure();
subplot(2,3,1)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,7).*180./pi, 'LineWidth', 1.5)
end
title('Roll vs t'), xlabel('t'), ylabel('Roll (deg)')
subplot(2,3,2)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,8).*180./pi, 'LineWidth', 1.5)
end
title('Pitch vs t'), xlabel('t'), ylabel('Pitch (deg)')
subplot(2,3,3)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,9).*180./pi, 'LineWidth', 1.5)
end
title('Yaw vs t'), xlabel('t'), ylabel('Yaw (deg)')

subplot(2,3,4)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,10).*180./pi, 'LineWidth', 1.5)
end
title('Roll rate vs t'), xlabel('t'), ylabel('Roll rate (deg/s)')
subplot(2,3,5)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,11).*180./pi, 'LineWidth', 1.5)
end
title('Pitch rate vs t'), xlabel('t'), ylabel('Pitch rate (deg/s)')
subplot(2,3,6)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,12).*180./pi, 'LineWidth', 1.5)
end
title('Yaw rate vs t'), xlabel('t'), ylabel('Yaw rate (deg/s)')

%% Inputs
f = figure();
subplot(2, 2, 1)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).control(:,1), 'LineWidth', 1.5)
end
title('T vs t'), xlabel('t'), ylabel('T')
subplot(2, 2, 2)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).control(:,2), 'LineWidth', 1.5)
end
title('\tau_{\phi} vs t'), xlabel('t'), ylabel('\tau_{\phi}')
subplot(2, 2, 3)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).control(:,3), 'LineWidth', 1.5)
end
title('\tau_{\theta} vs t'), xlabel('t'), ylabel('\tau_{\theta}')
subplot(2, 2, 4)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).control(:,4), 'LineWidth', 1.5)
end
title('\tau_{\psi} vs t'), xlabel('t'), ylabel('\tau_{\psi}')
