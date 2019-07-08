function saveToExcel(solution)
%SAVETOEXCEL Saves data to Excel format to generate a video of the drone

n_gates = length(solution.phase);

time_tot = [];
x_tot = []; y_tot = []; z_tot = [];
roll_tot = []; pitch_tot = []; yaw_tot = [];

for i_phase = 1:n_gates
    time_tot  = [time_tot; solution.phase(i_phase).time];
    x_tot     = [x_tot; solution.phase(i_phase).state(:,1)];
    y_tot     = [y_tot; solution.phase(i_phase).state(:,2)];
    z_tot     = [z_tot; solution.phase(i_phase).state(:,3)];
    
    roll_tot  = [roll_tot; solution.phase(i_phase).state(:,7)];
    pitch_tot = [pitch_tot; solution.phase(i_phase).state(:,8)];
    yaw_tot   = [yaw_tot; solution.phase(i_phase).state(:,9)];
end

T = table(time_tot,x_tot, y_tot, z_tot,roll_tot, pitch_tot, yaw_tot);
filename = 'droneSolution.xlsx';
writetable(T,filename,'Sheet',1);
