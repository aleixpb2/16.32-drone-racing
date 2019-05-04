function output = droneEndpoint(input)
% Objective function, endpoint constraints, state continuity across phases

for i_phase = 1:gates.n
    t0{i_phase} = input.phase(i_phase).initialtime;
    tf{i_phase} = input.phase(i_phase).finaltime;
    x0{i_phase} = input.phase(i_phase).initialstate;
    xf{i_phase} = input.phase(i_phase).finalstate;
end

% Constraints
output.eventgroup(1).event = [xf{1}(1:2)-x0{2}(1:2), tf{1}-t0{2}];
output.eventgroup(2).event = [xf{2}(1:2)-x0{3}(1:2), tf{2}-t0{3}];

output.objective = input.phase(end).finaltime;
