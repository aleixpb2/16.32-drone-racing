function output = droneEndpoint(input)
% Objective function, endpoint constraints, state continuity across phases

for i_phase = 1:n_gates
    t0{i_phase} = input.phase(i_phase).initialtime;
    tf{i_phase} = input.phase(i_phase).finaltime;
    x0{i_phase} = input.phase(i_phase).initialstate;
    xf{i_phase} = input.phase(i_phase).finalstate;
    
    % Phase continuity constraints (n-1)
    if i_phase < n_gates
    output.eventgroup(i_phase).event = ...
        [xf{i_phase}-x0{i_phase+1}, tf{i_phase}-t0{i_phase+1}];
    end    
end

% minimize the time spent on the race
output.objective = input.phase(end).finaltime;
