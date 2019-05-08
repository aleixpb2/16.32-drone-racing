% GPOPS-II solution
close all;

solution = output.result.solution;

% %% Position
f = figure();
subplot(1,3,1)
hold on
for i_phase = 1:n_gates
    plot(solution.phase(i_phase).time, solution.phase(i_phase).state(:,1), 'LineWidth', 1.5)
end
title('x vs t')
xlabel('t'), ylabel('x')

subplot(1,3,2)
for i_phase = 1:n_gates
    plot(solution.phase(i_phase).time, solution.phase(i_phase).state(:,3), 'LineWidth', 1.5)
end
title('z vs t')
xlabel('t'), ylabel('z')

subplot(1,3,3)
for i_phase = 1:n_gates
    plot(solution.phase(i_phase).state(:,1), solution.phase(i_phase).state(:,3), 'LineWidth', 1.5)
end
title('z vs x')
xlabel('x'), ylabel('z')

%% Orientation
f = figure();
hold on
for i_phase = 1:n_gates
    subplot(1,3,1)
    plot(solution.phase(i_phase).time, solution.phase(i_phase).state(:,4).*180./pi, 'LineWidth', 1.5)
    title('Roll vs t'), xlabel('t'), ylabel('Roll (deg)')
    subplot(1,3,2)
    plot(solution.phase(i_phase).time, solution.phase(i_phase).state(:,5).*180./pi, 'LineWidth', 1.5)
    title('Pitch vs t'), xlabel('t'), ylabel('Pitch (deg)')
    subplot(1,3,3)
    plot(solution.phase(i_phase).time, solution.phase(i_phase).state(:,6).*180./pi, 'LineWidth', 1.5)
    title('Yaw vs t'), xlabel('t'), ylabel('Yaw (deg)')
end

%% Inputs
f = figure();
subplot(1, 2, 1)
for i_phase = 1:n_gates
    plot(solution.phase(i_phase).time, solution.phase(i_phase).control(:,1))
end
title('T vs t')
xlabel('t'), ylabel('T')

subplot(1, 2, 2)
hold on
title('taus vs t')
xlabel('t'), ylabel('taus')
for i_phase = 1:n_gates
    plot(solution.phase(i_phase).time, solution.phase(i_phase).control(:,2), 'LineWidth', 1.5)
    plot(solution.phase(i_phase).time, solution.phase(i_phase).control(:,3), 'LineWidth', 1.5)
    plot(solution.phase(i_phase).time, solution.phase(i_phase).control(:,4), 'LineWidth', 1.5)
end
legend('tau phi', 'tau theta', 'tau psi')
