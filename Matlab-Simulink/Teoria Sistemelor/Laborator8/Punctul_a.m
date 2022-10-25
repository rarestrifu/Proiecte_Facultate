% Performantele sistemelor de ordin I si II

% a)
H = tf(3,[1 5]);

figure
step(H);

% Timp de ridicare : 0.439s
% Timp de raspuns : 0.782s
% Eroarea la pozitie: 1 - 0.6 = 0.4

figure
t = 0:1e-6:10;
u = @(t)(t>=0).*(t);
lsim(H,u(t),t);

%Eroarea la viteza: inf