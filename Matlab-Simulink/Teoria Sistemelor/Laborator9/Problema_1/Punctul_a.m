
% Problema 1 
% Subpunctul a)
% R1 - variabil R2 = 2.2 [kOhm], C = 100 [microF] :

Hdes = tf([2.2*10^4 10^5], [1 2 0]);
rlocus(Hdes);
