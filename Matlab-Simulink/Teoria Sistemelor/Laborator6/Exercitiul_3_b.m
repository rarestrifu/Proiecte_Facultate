% Declar constantele:
M = 0.5;
m = 0.2;
b = 0.1;
l = 0.3;
I = 0.006;
g = 10;

% Declar spatiul starilor pentru functia de transfer Hphi,u(s) :
A = [0 1 0 0;
    0 (I+m*(l^2))/((m+M)*I + m*M*(l^2)) (I+m*(l^2))/((m+M)*I + m*M*(l^2))*(M+m)-g 0;
    0 0 0 1;
    0 -b/(M*I/m*l + I/l +M*l) (M+m)/(M*I/m*l+I/l+M*l) 0];
B = [0;
     (I+m*(l^2))/((m+M)*I + m*M*(l^2));
     0;
     1/(M*I/m*l + I/l + M*l)];
C = [0 0 1 0];
D = 0;

[num,den] = ss2tf(A,B,C,D);

% Determin daca sistemul este stabil intern prin valorii proprii:
eig(A);     % Are 2 valori cu partea reala > 0 => instabil intern

% Determin daca sistemul este stabil intern prin ecuatia lui Lyapunov:
P = lyap(A',eye(4));
eig(P);     % Valorile proprii sunt < 0 => instabil intern

% Determin daca sistemul este stabil extern:
roots(den);  % Are doua solutii cu partea reala > 0 => instabil extern

% Reprezentare grafica: 

sys = ss(A,B,C,D);
t = 0:1e-3:50;
u = ones(1,length(t));

[y,t,x]=lsim(sys,u,t);

figure, plot(t,x),title("Starile in timp:");
figure, plot(t,y),title("Raspunsul in timp:");