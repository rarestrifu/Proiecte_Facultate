% Performantele sistemelor de ordin I si II

% f)
H = tf(1,[1 1 1]);

figure
step(H);

% Timp de ridicare : 1.64s
% Timp de raspuns : 8.08s
% Eroarea la pozitie : 1 - 1 = 0s
% Suprareglajul : 16.3%

figure
t = 0:1e-6:10;
u = @(t)(t>=0).*(t);
lsim(H,u(t),t);

%Eroarea la viteza: 5.34 -4.38 = 1.04