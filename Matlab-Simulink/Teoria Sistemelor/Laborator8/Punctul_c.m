% Performantele sistemelor de ordin I si II

% c)
H = tf([40 40],[1 10]);

figure
step(H);

% Timp de ridicare : 0
% Timp de raspuns : 0.611s 
% Eroarea la pozitie: 1 - 4 = -3

figure
t = 0:1e-6:10;
u = @(t)(t>=0).*(t);
lsim(H,u(t),t);

%Eroarea la viteza: inf