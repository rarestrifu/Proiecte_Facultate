% Performantele sistemelor de ordin I si II

% b)
H = tf(1,[1 2 0]);

figure
step(H);

% Timp de ridicare : N/A
% Timp de raspuns : N/A
% Eroarea la pozitie: inf

figure
t = 0:1e-6:10;
u = @(t)(t>=0).*(t);
lsim(H,u(t),t);

%Eroarea la viteza: inf