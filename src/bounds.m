function bounds = bounds

tmin = [0 .15 .7 1];
tmax = [0 .3 .9 1];
xmin = [0 .01 .1 .5];
xmax = [0 .4 .4 .5];
vmin = [.1 .2 .3 .8];
vmax = [.1 .7 .8 .8];
umin = 0;
umax = 2;

state_low = [0 0];
state_up = [1 1];
intmin = -100;
int_max = 100;


z_min = 0;
z_max = 100;

for i_phase = 1:3
  bounds.phase(i_phase).initialtime.lower = tmin(i_phase);
  bounds.phase(i_phase).initialtime.upper = tmax(i_phase);
  bounds.phase(i_phase).finaltime.lower = tmin(i_phase+1);
  bounds.phase(i_phase).finaltime.upper =  tmax(i_phase+1);
  bounds.phase(i_phase).initialstate.lower = [xmin(i_phase) vmin(i_phase)];
  bounds.phase(i_phase).initialstate.upper = [xmax(i_phase) vmax(i_phase)];
  bounds.phase(i_phase).state.lower = state_low;
  bounds.phase(i_phase).state.upper = state_up;
  bounds.phase(i_phase).finalstate.lower = [xmin(i_phase+1) vmin(i_phase+1)];
  bounds.phase(i_phase).finalstate.upper = [xmax(i_phase+1) vmax(i_phase+1)];
  bounds.phase(i_phase).control.lower = umin;
  bounds.phase(i_phase).control.upper = umax;
  bounds.phase(i_phase).integral.lower = intmin;
  bounds.phase(i_phase).integral.upper = int_max;
  
  bounds.phase(iphase).path.lower  = 0;
  bounds.phase(iphase).path.upper  = 100;
end

% bounds.phase(2).path.lower = 0;
% bounds.phase(2).path.upper = 0;

bounds.eventgroup(1).lower = zeros(1,3);
bounds.eventgroup(1).upper = zeros(1,3);
bounds.eventgroup(2).lower = zeros(1,3);
bounds.eventgroup(2).upper = zeros(1,3);

end
