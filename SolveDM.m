function [ TOUT, YOUT ] = SolveDM( y0, rb )
%SOLVEDM Resuelve el sistema de ecuaciones diferenciales para pacientes con
%diabetis melitus tipo 1. y0 es la condici?n inicial y rb es la velocidad
%de infusi?n de insulina. 

b0 = 0.95; b1 = 0.001; b2 = 0.0002; c1 = 0.05; c2 = 0.04;

F = @(t,y) [b0 + b1*y(1) - b2*y(1)*y(2);...
            -c1*y(2) + c2*rb];
        
tspan = 1:500;
        
[TOUT, YOUT] = ode45(F, tspan, y0);

end

