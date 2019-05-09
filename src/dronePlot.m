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
for i_phase = 1:n_gates
    time_tot  = [time_tot; solution.phase(i_phase).time];
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
end

% Set to 0 elements that are very small
pos_tol = 0.001; vel_tol = pos_tol; orient_tol = 0.5*pi/180; rate_tol = orient_tol;
T_tol = 0.1; tau_tol = 0.1;
x_tot(abs(x_tot) < pos_tol) = 0;
y_tot(abs(y_tot) < pos_tol) = 0;
z_tot(abs(z_tot) < pos_tol) = 0;
vel_x_tot(abs(vel_x_tot) < vel_tol) = 0;
vel_y_tot(abs(vel_y_tot) < vel_tol) = 0;
vel_z_tot(abs(vel_z_tot) < vel_tol) = 0;
roll_tot(abs(roll_tot) < orient_tol)   = 0;
pitch_tot(abs(pitch_tot) < orient_tol) = 0;
yaw_tot(abs(yaw_tot) < orient_tol)     = 0;
p_tot(abs(p_tot) < rate_tol) = 0;
q_tot(abs(q_tot) < rate_tol) = 0;
r_tot(abs(r_tot) < rate_tol) = 0;

T_tot(abs(T_tot) < T_tol) = 0;
troll_tot(abs(troll_tot) < tau_tol) = 0;
tpitch_tot(abs(tpitch_tot) < tau_tol) = 0;
tyaw_tot(abs(tyaw_tot) < tau_tol) = 0;

%% Position
f = figure();
hold on

subplot(2,3,1)
plot(time_tot, x_tot, 'LineWidth', 1.5)
title('x vs t'), xlabel('t'), ylabel('x')
subplot(2,3,2)
plot(time_tot, y_tot, 'LineWidth', 1.5)
title('y vs t'), xlabel('t'), ylabel('y')
subplot(2,3,3)
plot(time_tot, z_tot, 'LineWidth', 1.5)
title('z vs t'), xlabel('t'), ylabel('z')
subplot(2,3,4)
plot(x_tot, y_tot, 'LineWidth', 1.5)
title('y vs x'), xlabel('x'), ylabel('y')
subplot(2,3,5)
plot(x_tot, z_tot, 'LineWidth', 1.5)
title('z vs x'), xlabel('x'), ylabel('z')
subplot(2,3,6)
plot(y_tot, z_tot, 'LineWidth', 1.5)
title('z vs y'), xlabel('y'), ylabel('z')

% 3D plot
f = figure();
plot3(x_tot, y_tot, z_tot, 'LineWidth', 1.5)
tmpAspect=daspect();
daspect(tmpAspect([1 1 1]))
xlabel('x'), ylabel('y'), zlabel('z')
grid on

%% Velocity
f = figure();
hold on
subplot(1,3,1)
plot(time_tot, vel_x_tot, 'LineWidth', 1.5)
title('v_x vs t'), xlabel('t'), ylabel('v_x')
subplot(1,3,2)
plot(time_tot, vel_y_tot, 'LineWidth', 1.5)
title('v_y vs t'), xlabel('t'), ylabel('v_y')
subplot(1,3,3)
plot(time_tot, vel_z_tot, 'LineWidth', 1.5)
title('v_z vs t'), xlabel('t'), ylabel('v_z')

%% Orientation
f = figure();
hold on
subplot(1,3,1)
plot(time_tot, roll_tot.*180./pi, 'LineWidth', 1.5)
title('Roll vs t'), xlabel('t'), ylabel('Roll (deg)')
subplot(1,3,2)
plot(time_tot, pitch_tot.*180./pi, 'LineWidth', 1.5)
title('Pitch vs t'), xlabel('t'), ylabel('Pitch (deg)')
subplot(1,3,3)
plot(time_tot, yaw_tot.*180./pi, 'LineWidth', 1.5)
title('Yaw vs t'), xlabel('t'), ylabel('Yaw (deg)')

%% Rates
f = figure();
hold on
subplot(1,3,1)
plot(time_tot, p_tot.*180./pi, 'LineWidth', 1.5)
title('Roll rate vs t'), xlabel('t'), ylabel('Roll rate (deg/s)')
subplot(1,3,2)
plot(time_tot, q_tot.*180./pi, 'LineWidth', 1.5)
title('Pitch rate vs t'), xlabel('t'), ylabel('Pitch rate (deg/s)')
subplot(1,3,3)
plot(time_tot, r_tot.*180./pi, 'LineWidth', 1.5)
title('Yaw rate vs t'), xlabel('t'), ylabel('Yaw rate (deg/s)')


%% Inputs
f = figure();
subplot(1, 2, 1)
plot(time_tot, T_tot)
title('T vs t'), xlabel('t'), ylabel('T')

subplot(1, 2, 2)
hold on
title('taus vs t'), xlabel('t'), ylabel('taus')
plot(time_tot, troll_tot, 'LineWidth', 1.5)
plot(time_tot, tpitch_tot, 'LineWidth', 1.5)
plot(time_tot, tyaw_tot, 'LineWidth', 1.5)
legend('Tau phi', 'Tau theta', 'Tau psi')
