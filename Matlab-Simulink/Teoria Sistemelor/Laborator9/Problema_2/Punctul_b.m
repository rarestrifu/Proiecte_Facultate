
% Problema 2
% Subpunctul b):
% R2 - variabil , R1 = 10[kOhm], C = 100[microF];

H = tf([0.01 0.07 0],[1 0 1 7]);
rlocus(H);

% K = R2;
% Sistemul este instabil!