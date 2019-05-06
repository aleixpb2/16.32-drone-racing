function bounds = bounds

pos_low = [];
pos_up = [];  % Gates constraints
vel_low = [];
vel_up = [];
orient_low = [];
orient_up = [];
rate_low = [];
rate_up = [];


zmin = 0;
zmax = 100;

for i_phase = 1:gates.n
    %TODO
    bounds.phase(i_phase).initialtime.lower = tmin(i_phase);
    bounds.phase(i_phase).initialtime.upper = tmax(i_phase);
    bounds.phase(i_phase).finaltime.lower = tmin(i_phase+1);
    bounds.phase(i_phase).finaltime.upper =  tmax(i_phase+1);
    bounds.phase(i_phase).initialstate.lower = [xmin(i_phase) vmin(i_phase)];
    bounds.phase(i_phase).initialstate.upper = [xmax(i_phase) vmax(i_phase)];
    bounds.phase(i_phase).state.lower = state_low;
    bounds.phase(i_phase).state.upper = state_up;
    bounds.phase(i_phase).finalstate.lower = ...
        [gates(i_phase).x, gates(i_phase).y, gates(i_phase).z,
        ];  % Gate (position) constraints
    bounds.phase(i_phase).finalstate.upper = ...
        [gates(i_phase).x, gates(i_phase).y, gates(i_phase).z,]
    bounds.phase(i_phase).control.lower = umin;
    bounds.phase(i_phase).control.upper = umax;
    %bounds.phase(i_phase).integral.lower = intmin;
    %bounds.phase(i_phase).integral.upper = intmax;

    bounds.phase(iphase).path.lower  = zmin;  % z constraint
    bounds.phase(iphase).path.upper  = zmax;
    
    % Phase continuity constraints (n-1)
    if i_phase < gates.n
        bounds.eventgroup(i_phase).lower = zeros(1, 13);  % states and t
        bounds.eventgroup(i_phase).upper = zeros(1, 13);
    end
    
end

end
