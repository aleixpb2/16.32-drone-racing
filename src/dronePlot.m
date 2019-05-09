% GPOPS-II solution
close all;

solution = output.result.solution;

% Group variables
time_tot = [];
x_tot = []; y_tot = []; z_tot = [];
vel_x_tot = []; vel_y_tot = []; vel_z_tot = [];
roll_tot = []; pitch_tot = []; yaw_tot = [];
p_tot = []; q_tot = []; r_tot = [];
T_tot = []; troll_tot = []; tpitch_tot = []; tyaw_tot = [];
xgates_tot = []; ygates_tot = []; zgates_tot = [];
time_gates = [];
for i_phase = 1:n_gates
    time_tot  = [time_tot; solution.phase(i_phase).time];
    time_gates = [time_gates; time_tot(end)];
    x_tot     = [x_tot; solution.phase(i_phase).state(:,1)];
    y_tot     = [y_tot; solution.phase(i_phase).state(:,2)];
    z_tot     = [z_tot; solution.phase(i_phase).state(:,3)];
    vel_x_tot = [vel_x_tot; solution.phase(i_phase).state(:,4)];
    vel_y_tot = [vel_y_tot; solution.phase(i_phase).state(:,5)];
    vel_z_tot = [vel_z_tot; solution.phase(i_phase).state(:,6)];
    roll_tot  = [roll_tot; solution.phase(i_phase).state(:,7)];
    pitch_tot = [pitch_tot; solution.phase(i_phase).state(:,8)];
    yaw_tot   = [yaw_tot; solution.phase(i_phase).state(:,9)];
    p_tot     = [p_tot; solution.phase(i_phase).state(:,10)];
    q_tot     = [q_tot; solution.phase(i_phase).state(:,11)];
    r_tot     = [r_tot; solution.phase(i_phase).state(:,12)];
    
    T_tot      = [T_tot; solution.phase(i_phase).control(:,1)];
    troll_tot  = [troll_tot; solution.phase(i_phase).control(:,2)];
    tpitch_tot = [tpitch_tot; solution.phase(i_phase).control(:,3)];
    tyaw_tot   = [tyaw_tot; solution.phase(i_phase).control(:,4)];
    
    xgates_tot = [xgates_tot; gates(i_phase).x];
    ygates_tot = [ygates_tot; gates(i_phase).y];
    zgates_tot = [zgates_tot; gates(i_phase).z];
end

% % Set to 0 elements that are very small
% pos_tol = 0.001; vel_tol = pos_tol; orient_tol = 0.5*pi/180; rate_tol = orient_tol;
% T_tol = 0.1; tau_tol = 0.05;
% x_tot(abs(x_tot) < pos_tol) = 0;
% y_tot(abs(y_tot) < pos_tol) = 0;
% z_tot(abs(z_tot) < pos_tol) = 0;
% vel_x_tot(abs(vel_x_tot) < vel_tol) = 0;
% vel_y_tot(abs(vel_y_tot) < vel_tol) = 0;
% vel_z_tot(abs(vel_z_tot) < vel_tol) = 0;
% roll_tot(abs(roll_tot) < orient_tol)   = 0;
% pitch_tot(abs(pitch_tot) < orient_tol) = 0;
% yaw_tot(abs(yaw_tot) < orient_tol)     = 0;
% p_tot(abs(p_tot) < rate_tol) = 0;
% q_tot(abs(q_tot) < rate_tol) = 0;
% r_tot(abs(r_tot) < rate_tol) = 0;
% T_tot(abs(T_tot) < T_tol) = 0;
% troll_tot(abs(troll_tot) < tau_tol) = 0;
% tpitch_tot(abs(tpitch_tot) < tau_tol) = 0;
% tyaw_tot(abs(tyaw_tot) < tau_tol) = 0;

%% Position and velocity
f = figure();
subplot(2,3,1)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,1), 'LineWidth', 1.5)
end
plot(0,0,'*', 'LineWidth', 2)
plot(time_gates, xgates_tot, 'o')
title('x vs t'), xlabel('t'), ylabel('x')
subplot(2,3,2)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,2), 'LineWidth', 1.5)
end
plot(0,0,'*', 'LineWidth', 2)
plot(time_gates, ygates_tot, 'o')
title('y vs t'), xlabel('t'), ylabel('y')
subplot(2,3,3)
hold on
for i = 1:n_gates
    plot(solution.phase(i).time, solution.phase(i).state(:,3), 'LineWidth', 1.5)
end
plot(0,0,'*', 'LineWidth', 2)
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
