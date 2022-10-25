
% Problema 1 
% Subpunctul b)
% R2 - variabil R1 = 10 [kOhm], C = 100 [microF] :

Hdes = tf([10^(-3) 0], [1 2 10]);
rlocus(Hdes);
