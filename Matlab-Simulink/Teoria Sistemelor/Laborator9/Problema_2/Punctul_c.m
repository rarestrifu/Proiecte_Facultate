
% Problema 2
% Subpunctul c):
% C - variabil ,R1 = 10[kOhm], R2 = 2.2[kOhm];

H = tf([1 7],[10^4 2.2*10^3 2.2*7*10^3]);
rlocus(H);
