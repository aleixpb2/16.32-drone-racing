function guess = guesses

guess.phase(i_phase).time    = [t_min; t_max]; 
guess.phase(i_phase).state   = ... 
guess.phase(i_phase).control = [u_min; u_max];

end
