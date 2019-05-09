function guess = guesses

global n_gates

t_min = 0;
t_max = n_gates*2;

time_vec = linspace(t_min, t_max, n_gates+1);

pos_min = -10;
pos_max = 50;
vel_min = -20;
vel_max = 20;
orient_min = -70*pi/180;
orient_max = -orient_min;
rate_min = -70*pi/180;
rate_max = -rate_min;

T_min = 0;
T_max = 15;
tau_min = -1;
tau_max = -tau_min;


for i_phase = 1:n_gates
    guess.phase(i_phase).time         = [time_vec(i_phase); time_vec(i_phase+1)]; % It has to be monotonically increasing
    guess.phase(i_phase).state(:,  1) = [pos_min; pos_max];
    guess.phase(i_phase).state(:,  2) = [pos_min; pos_max];
    guess.phase(i_phase).state(:,  3) = [pos_min; pos_max];
    guess.phase(i_phase).state(:,  4) = [vel_min; vel_max];
    guess.phase(i_phase).state(:,  5) = [vel_min; vel_max];
    guess.phase(i_phase).state(:,  6) = [vel_min; vel_max];
    guess.phase(i_phase).state(:,  7) = [orient_min; orient_max];
    guess.phase(i_phase).state(:,  8) = [orient_min; orient_max];
    guess.phase(i_phase).state(:,  9) = [orient_min; orient_max];
    guess.phase(i_phase).state(:, 10) = [rate_min; rate_max];
    guess.phase(i_phase).state(:, 11) = [rate_min; rate_max];
    guess.phase(i_phase).state(:, 12) = [rate_min; rate_max];
    guess.phase(i_phase).control(:,1) = [T_min; T_max];
    guess.phase(i_phase).control(:,2) = [tau_min; tau_max];
    guess.phase(i_phase).control(:,3) = [tau_min; tau_max];
    guess.phase(i_phase).control(:,4) = [tau_min; tau_max];
end
