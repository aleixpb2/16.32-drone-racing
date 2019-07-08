% Parameters regarding the race (gates)

global gates n_gates
 
% Gate for the simple experiment
% gates(1).x = 1;
% gates(1).y = 0;
% gates(1).z = 0.5;


gates(1).x = 1;
gates(1).y = 0;
gates(1).z = 1;

gates(2).x = 1;
gates(2).y = 1;
gates(2).z = 1;

gates(3).x = 3;
gates(3).y = 2;
gates(3).z = 3;

gates(4).x = 3;
gates(4).y = 1;
gates(4).z = 1;

gates(5).x = 5;
gates(5).y = 0;
gates(5).z = 1;

n_gates = length(gates);
