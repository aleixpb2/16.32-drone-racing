function bounds = bounds
global gates n_gates

t_min = 0;
t_max = 60*2;  % s

pos_min = ones(1, 3)*-100;
pos_max = -pos_min;
vel_min = ones(1, 3)*-20;
vel_max = -vel_min;

% Orientation in rad
phi_min = -pi/2;
phi_max = pi/2;
theta_min = -pi/2;
theta_max = pi/2;
psi_min = -pi;
psi_max = pi;

orient_min = [phi_min, theta_min, psi_min];
orient_max = [phi_max, theta_max, psi_max];

% Rate in rad/s
p_max = 60*(pi/180);
q_max = 60*(pi/180);
r_max = 60*(pi/180);

p_min = -p_max;
q_min = -q_max;
r_min = -r_max;

rate_min = [p_min, q_min, r_min];
rate_max = [p_max, q_max, r_max];

% Input limits
T_min = 0;
T_max = 20;   % k*4*w^2
tau_phi_min = -5;
tau_phi_max = -tau_phi_min;
tau_theta_min = tau_phi_min;
tau_theta_max = tau_phi_max;
tau_psi_min = -1.5;
tau_psi_max = -tau_psi_min;

u_min = [T_min, tau_phi_min, tau_theta_min, tau_psi_min];
u_max = [T_max, tau_phi_max, tau_theta_max, tau_psi_max];

% Path constraint
z_min = 0;  % TODO
z_max = 100;

for i_phase = 1:n_gates
    bounds.phase(i_phase).initialtime.lower = t_min;
    bounds.phase(i_phase).initialtime.upper = t_max;
    bounds.phase(i_phase).finaltime.lower = t_min;
    bounds.phase(i_phase).finaltime.upper =  t_max;
    bounds.phase(i_phase).initialstate.lower = ...
        [pos_min, vel_min,  orient_min, rate_min];
    bounds.phase(i_phase).initialstate.upper = ...
        [pos_max, vel_max,  orient_max, rate_max];
    bounds.phase(i_phase).state.lower = ...
        [pos_min, vel_min,  orient_min, rate_min];
    bounds.phase(i_phase).state.upper = ...
        [pos_max, vel_max,  orient_max, rate_max];
    bounds.phase(i_phase).finalstate.lower = ...
        [gates(i_phase).x, gates(i_phase).y, gates(i_phase).z, ...
         vel_min,  orient_min, rate_min];  % Gate (position) constraints
    bounds.phase(i_phase).finalstate.upper = ...
        [gates(i_phase).x, gates(i_phase).y, gates(i_phase).z, ...
         vel_max,  orient_max, rate_max];
    bounds.phase(i_phase).control.lower = u_min;
    bounds.phase(i_phase).control.upper = u_max;

    bounds.phase(i_phase).path.lower  = z_min;  % z constraint
    bounds.phase(i_phase).path.upper  = z_max;
    
    % Phase continuity constraints (n-1)
    if i_phase < n_gates
        bounds.eventgroup(i_phase).lower = zeros(1, 13);  % states and t
        bounds.eventgroup(i_phase).upper = zeros(1, 13);
    end
    
end

% Set initial conditions
bounds.phase(1).initialtime.lower = 0;
bounds.phase(1).initialtime.upper = 0;
bounds.phase(1).initialstate.lower = zeros(1,12);
bounds.phase(1).initialstate.upper = zeros(1,12);
% TODO
bounds.phase(1).initialstate.lower(3) = 0;  % z ini
bounds.phase(1).initialstate.upper(3) = 0;
bounds.phase(1).initialstate.lower(9) = 0*pi/180;  % yaw ini
bounds.phase(1).initialstate.upper(9) = 0*pi/180;

end
