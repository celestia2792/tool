clear; clc;
% Circuit parameters
L = 10e-3;          % H
C = 10e-6;          % F
R = 15.81;             % ohm
% Input (step)
I0 = 1;             % A
Is = @(t) I0;
% Simulation settings
h = 1e-6;           % s
T = 5e-3;           % s
t = 0:h:T;
N = length(t);
% States
v  = zeros(1,N);    % voltage [V]
iL = zeros(1,N);    % inductor current [A]
% Initial conditions
v(1)  = 0;
iL(1) = 0;
% Forward Euler
for k = 1:N-1
dv  = (1/C) * ( Is(t(k)) -(1/R)*v(k) -iL(k) );
diL = (1/L) * v(k);
v(k+1)  = v(k)  + h*dv;
iL(k+1) = iL(k) + h*diL;
end
% Plot current
figure; plot(t, v, 'LineWidth', 1.5); grid on
xlabel('t (s)'); ylabel('v(t) (V)');
title(sprintf('Parallel RLC (Underdamped) Forward Euler | R=%.1fΩ, L=%.3gH, C=%.3gF', R, L, C));