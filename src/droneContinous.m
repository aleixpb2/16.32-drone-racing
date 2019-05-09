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
for i_phase = 1:n_gates  % TODO: need to iterate?
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
    
    ctheta(ctheta==0) = 0.001;
    assert(all(ctheta))  % elements are nonzero TODO
    
    pos_dot(:,1)     = vel_x;
    pos_dot(:,2)     = vel_y;
    pos_dot(:,3)     = vel_z;
    vel_dot(:,1)     = T.*(sphi.*spsi + cphi.*cpsi.*stheta)./m;% - Axyz(1).*vel_x./m;
    vel_dot(:,2)     = T.*(cphi.*spsi.*stheta - cpsi.*sphi)./m;% - Axyz(2).*vel_y./m;
    vel_dot(:,3)     = T.*(cphi.*ctheta)./m - g               ;% - Axyz(3).*vel_z./m;
    orient_dot(:,1)  = p + r.*(cphi.*ttheta) + q.*(sphi.*ttheta);
    orient_dot(:,2)  = q.*cphi - r.*sphi;
    orient_dot(:,3)  = r.*cphi./ctheta + q.*sphi./ctheta;
    rate_dot(:,1)    = ((Iy - Iz).*r.*q + tau_phi)./Ix;
    rate_dot(:,2)    = ((Iz - Ix).*p.*r + tau_theta)./Iy;
    rate_dot(:,3)    = ((Ix - Iy).*p.*q + tau_psi)./Iz;
    
    output(i_phase).dynamics   = [pos_dot, vel_dot, orient_dot, rate_dot];
    output(i_phase).path       = input.phase(i_phase).state(:,3);  % z
end
