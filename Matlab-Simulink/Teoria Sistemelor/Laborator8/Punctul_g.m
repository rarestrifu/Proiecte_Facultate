% Performantele sistemelor de ordin I si II

% g)
H = tf([1 1],[1 0 1]);

figure
step(H,100);

% Timp de ridicare : N/A
% Timp de raspuns : N/A
% Eroarea la pozitie: N/A

figure
t = 0:1e-6:10;
u = @(t)(t>=0).*(t);
lsim(H,u(t),t);

%Eroarea la viteza: N/A