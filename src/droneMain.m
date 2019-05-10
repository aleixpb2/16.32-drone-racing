clear all; close all; clc

%---------------------------------------------------%
%- Provide Mesh Refinement Method and Initial Mesh -%
%---------------------------------------------------%
% mesh.method = 'hp-PattersonRao';
% mesh.tolerance = 1e-3;
% mesh.maxiteration = 1;  % 20
% mesh.colpointsmin = 4;
% mesh.colpointsmax = 14;
% %mesh.phase.colpoints = 4*ones(1,mesh.colpointsmax);
% %mesh.phase.fraction = ones(1,mesh.colpointsmax)./mesh.colpointsmax;

%---------------------------------------------------%
%--- Assemble Information into Problem Structure ---%
%---------------------------------------------------%
raceParams                        % load race parameters

setup.name                        = 'Drone-Racing';
setup.functions.continuous        = @droneContinous;
setup.functions.endpoint          = @droneEndpoint;
setup.bounds                      = bounds;
setup.guess                       = guesses;
setup.auxdata                     = droneParams;
% setup.mesh                        = mesh;
setup.nlp.solver                  = 'ipopt';
setup.derivatives.supplier        = 'sparseCD';
setup.derivatives.derivativelevel = 'second';
setup.method                      = 'RPM-Differentiation';

%---------------------------------------------------%
%----------- Solve Problem Using GPOPS2 ------------%
%---------------------------------------------------%

output   = gpops2(setup);
solution = output.result.solution;

save('droneSolution')
saveToExcel(solution);

% Plot
dronePlot

% TODO: search todos in the code. Repeat results for small u_taus, now they
% reach the rate limit. Increase the limits and inertias too.

