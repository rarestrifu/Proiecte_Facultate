
% Problema 2
% Subpunctul a):
% R1 - variabil , R2 = 2.2[kOhm], C = 100[microF];

H = tf([0.22 2.54 7],[10^(-4) 0 0 0]);
rlocus(H);

% K = 1/R1;
% Sistemul este instabil!