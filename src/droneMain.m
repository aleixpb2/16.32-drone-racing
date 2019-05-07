clear all; close all; clc

%---------------------------------------------------%
%- Provide Mesh Refinement Method and Initial Mesh -%
%---------------------------------------------------%
% Mesh is optional, comment for now
% mesh.method = 'hp-PattersonRao';
% mesh.tolerance = 1e-3;
% mesh.maxiteration = 45;
% mesh.colpointsmin = 4;
% mesh.colpointsmax = 10;

%---------------------------------------------------%
%--- Assemble Information into Problem Structure ---%
%---------------------------------------------------%
raceParams                        % load race parameters

setup.name                        = 'Drone-Racing';
setup.functions.continuous        = @droneContinous;
setup.functions.endpoint          = @droneEndpoint;
setup.bounds                      = bounds;
setup.guess                       = guesses;
setup.auxdata                    = droneParams;
setup.mesh                        = mesh;
setup.nlp.solver                  = 'ipopt';
setup.derivatives.supplier        = 'sparseCD';
setup.derivatives.derivativelevel = 'second';
setup.method                      = 'RPM-Differentiation';

%---------------------------------------------------%
%----------- Solve Problem Using GPOPS2 ------------%
%---------------------------------------------------%

output   = gpops2(setup);
solution = output.result.solution;
