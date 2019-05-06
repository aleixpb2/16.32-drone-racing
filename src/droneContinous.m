function output = droneContinous(input)
% Dynamics, path constraints and integrands

g      = input.auxdata.g;
m      = input.auxdata.m;
%t     = input.phase.time;

% Dynamics
for i_phase = 1:n_gates  % TODO: need to iterate?
    
    %pos                    = input.phase(i_phase).state(:,1:3);
    vel                    = input.phase(i_phase).state(:,4:6);
    phi                    = input.phase(i_phase).state(:,7);
    theta                  = input.phase(i_phase).state(:,8);
    psi                    = input.phase(i_phase).state(:,9);
    p                      = input.phase(i_phase).state(:,10);
    q                      = input.phase(i_phase).state(:,11);
    r                      = input.phase(i_phase).state(:,12);
    T                      = input.phase(i_phase).control(:,1);
    tau_phi                = input.phase(i_phase).control(:,2);
    tau_theta              = input.phase(i_phase).control(:,3);
    tau_psi                = input.phase(i_phase).control(:,4);
    
    sphi   = sin(phi);
    stheta = sin(theta);
    spsi   = sin(psi);
    cphi   = cos(phi);
    ctheta = cos(theta);
    cpsi   = cos(psi);
    ttheta = tan(theta);
    
    pos_dot      = vel;
    vel_dot(1)   = -T./m.*(sphi.*spsi + cphi.*cpsi.*stheta);
    vel_dot(2)   = -T./m.*(cphi.*spsi.*stheta - cpsi.*sphi);
    vel_dot(3)   = g - T./m.*(cphi.*ctheta);
    orient_dot(1) = 
    
    rate_dot(1) = 
    
    output(i_phase).dynamics   = [pos_dot, vel_dot, orient_dot, rate_dot];
    output(i_phase).path       = input.phase(i_phase).state(:,3);  % z
end
