% Performantele sistemelor de ordin I si II

% e)
H = tf(1,[1 2 1]);

figure
step(H);

% Timp de ridicare : 3.36s
% Timp de raspuns : 5.83s
% Eroarea la pozitie: 1 - 1 = 0

figure
t = 0:1e-6:10;
u = @(t)(t>=0).*(t);
lsim(H,u(t),t);

%Eroarea la viteza: 6 - 4.02 = 1.98