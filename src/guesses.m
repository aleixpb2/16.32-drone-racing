function guess = guesses

global n_gates

t_min = 0;
t_max = n_gates*5;

time_vec = linspace(t_min, t_max, n_gates+1);

pos_min = 0;
pos_max = 20;
vel_min = 0;
vel_max = 10;

u_min = 0;
u_max = 0.2;


for i_phase = 1:n_gates
    guess.phase(i_phase).time         = [time_vec(i_phase); time_vec(i_phase+1)]; % It has to be monotonically increasing
    guess.phase(i_phase).state(:,  1) = [pos_min; pos_max];
    guess.phase(i_phase).state(:,  2) = [pos_min; pos_max];
    guess.phase(i_phase).state(:,  3) = [pos_min; pos_max];
    guess.phase(i_phase).state(:,  4) = [vel_min; vel_max];
    guess.phase(i_phase).state(:,  5) = [vel_min; vel_max];
    guess.phase(i_phase).state(:,  6) = [vel_min; vel_max];
    guess.phase(i_phase).state(:,  7) = [0; 0];
    guess.phase(i_phase).state(:,  8) = [0; 0];
    guess.phase(i_phase).state(:,  9) = [0; 0];
    guess.phase(i_phase).state(:, 10) = [0; 0];
    guess.phase(i_phase).state(:, 11) = [0; 0];
    guess.phase(i_phase).state(:, 12) = [0; 0];
    guess.phase(i_phase).control(:,1) = [u_min; u_max];
    guess.phase(i_phase).control(:,2) = [u_min; u_max];
    guess.phase(i_phase).control(:,3) = [u_min; u_max];
    guess.phase(i_phase).control(:,4) = [u_min; u_max];
end
