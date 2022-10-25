% Performantele sistemelor de ordin I si II

% i)
H = tf([2 0],[1 0 -4]);

figure
step(H);

%SISTEM INSTABIL!!!
%Nu se pune probelma calculului performantelor!

figure
t = 0:1e-6:10;
u = @(t)(t>=0).*(t);
lsim(H,u(t),t);
