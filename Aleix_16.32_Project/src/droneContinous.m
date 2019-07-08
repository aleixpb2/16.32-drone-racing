function output = droneContinous(input)
% Dynamics, path constraints and integrands

global n_gates
g      = input.auxdata.g;
m      = input.auxdata.M;
Axyz   = input.auxdata.Axyz;
Ix     = input.auxdata.Ix;
Iy     = input.auxdata.Iy;
Iz     = input.auxdata.Iz;

% Dynamics
for i_phase = 1:n_gates
    %pos                    = input.phase(i_phase).state(:,1:3);
    vel_x                  = input.phase(i_phase).state(:,4);
    vel_y                  = input.phase(i_phase).state(:,5);
    vel_z                  = input.phase(i_phase).state(:,6);
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

    pos_dot_x     = vel_x;
    pos_dot_y     = vel_y;
    pos_dot_z     = vel_z;
    vel_dot_x     = T.*(sphi.*spsi + cphi.*cpsi.*stheta)./m - Axyz(1).*vel_x./m;
    vel_dot_y     = T.*(cphi.*spsi.*stheta - cpsi.*sphi)./m - Axyz(2).*vel_y./m;
    vel_dot_z     = T.*(cphi.*ctheta)./m - g                - Axyz(3).*vel_z./m;
    orient_dot_x  = p + r.*(cphi.*ttheta) + q.*(sphi.*ttheta);
    orient_dot_y  = q.*cphi - r.*sphi;
    orient_dot_z  = r.*cphi./ctheta + q.*sphi./ctheta;
    rate_dot_x    = ((Iy - Iz).*r.*q + tau_phi)./Ix;
    rate_dot_y    = ((Iz - Ix).*p.*r + tau_theta)./Iy;
    rate_dot_z    = ((Ix - Iy).*p.*q + tau_psi)./Iz;
    
    output(i_phase).dynamics   = [pos_dot_x, pos_dot_y, pos_dot_z, ...
        vel_dot_x, vel_dot_y, vel_dot_z, orient_dot_x, orient_dot_y, orient_dot_z, ...
        rate_dot_x, rate_dot_y, rate_dot_z];
    output(i_phase).path       = input.phase(i_phase).state(:,3);  % z
end
