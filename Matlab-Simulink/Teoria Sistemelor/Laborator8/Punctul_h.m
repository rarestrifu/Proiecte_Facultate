% Performantele sistemelor de ordin I si II

% h)
H = tf([1 3],[1 2 2]);

figure
step(H);

% Timp de ridicare : 1.33s 
% Timp de raspuns : 3.88s
% Eroarea la pozitie: 1 - 1.5 = -0.5
% Suprareglaj : 5.12%

figure
t = 0:1e-6:10;
u = @(t)(t>=0).*(t);
lsim(H,u(t),t);

%Eroarea la viteza: inf