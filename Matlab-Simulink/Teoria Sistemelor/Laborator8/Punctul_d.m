% Performantele sistemelor de ordin I si II

% d)
H = tf(3,[1 3 2]);

figure
step(H);

% Timp de ridicare : 2.59 s
% Timp de raspuns : 4.6 s
% Eroarea la pozitie: 1 - 1.5 = -0.5

figure
t = 0:1e-6:10;
u = @(t)(t>=0).*(t);
lsim(H,u(t),t);

%Eroarea la viteza: inf