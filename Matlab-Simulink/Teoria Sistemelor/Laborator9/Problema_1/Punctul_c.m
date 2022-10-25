
% Problema 1 
% Subpunctul c)
% C - variabil R1 = 10 [kOhm], R2 = 2.2 [kOhm] :

Hdes = tf(10, [10^4 42*10^3 0]);
rlocus(Hdes);
