function guess = guesses

t0 = 0; tf = 1;
x0 = 1; xf = 0.5;
v0 = 0.1; vf = 0.8;
umin = 0; umax = 2;

i_phase = 1;
guess.phase(i_phase).time    = [t0; 0.2]; 
guess.phase(i_phase).state   = [x0 v0; 0.01 0.2];
guess.phase(i_phase).control = [umax; umax];
guess.phase(i_phase).integral = 0;

i_phase = 2;
guess.phase(i_phase).time    = [0.2; 0.8]; 
guess.phase(i_phase).state   = [0.04 0.4; 0.35 0.4];
guess.phase(i_phase).control = [0.5; 0.5];
guess.phase(i_phase).integral = 0;

i_phase = 3;
guess.phase(i_phase).time    = [t0; tf]; 
guess.phase(i_phase).state   = [0.4 0.4; xf vf];
guess.phase(i_phase).control = [umax; umax];
guess.phase(i_phase).integral = 0;

end
