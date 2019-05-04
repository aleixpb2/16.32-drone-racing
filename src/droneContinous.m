function output = droneContinous(input)
% Dynamics, path constraints and integrands

%g                 = input.auxdata.g;
%t                 = input.phase.time;

% Dynamics
for i_phase = 1:gates.n  % TODO: need to iterate?
    
    pos                    = input.phase(i_phase).state(:,1:3);
    vel                    = input.phase(i_phase).state(:,4:6);
    orient                 = input.phase(i_phase).state(:,4:6);
    vel                    = input.phase(i_phase).state(:,4:6);
    u                    = input.phase(i_phase).control;
    xdot                 = v;
    vdot                 = -v + u;
    output(i_phase).dynamics   = [xdot, vdot];
    
    % TODO: CONSTRAIN z >= 0
end


