function output = droneContinous(input)

%g                 = input.auxdata.g;
%t                 = input.phase.time;

% Phase 1
x                    = input.phase(1).state(:,2);
v                    = input.phase(1).state(:,2);
u                    = input.phase(1).control;
xdot                 = v;
vdot                 = -v + u;
output(1).dynamics   = [xdot, vdot];
output(1).integrand  = u.*v;

% Phase 2: now u = v
v                 = input.phase(2).state(:,2);
u                 = v;
xdot              = v;
vdot              = -v + u;
output(2).dynamics = [xdot, vdot];
output(2).integrand = u.*v;
% output(2).path  = input.phase(2).state(:,2)-input.phase(2).control;

% Phase 3
v                    = input.phase(3).state(:,2);
u                    = input.phase(3).control;
xdot                 = v;
vdot                 = -v + u;
output(3).dynamics   = [xdot, vdot];
output(3).integrand  = u.*v;

end
