% Declar constantele:
mb = 300;
mw = 60;
bs = 1000;
bt = 0;
ks = 16000;
kt = 190000;

% Declar spatiul starilor pentru functia de transfer Hx,u(s) :
A = [0 1 0 0;
   -ks/mb -bs/mb ks/mb bs/mb;
    0 0 0 1;
    ks/mw bs/mw -(ks+kt)/mw -bs/mw];
B = [0;
     0;
     0;
     kt/mw];
C = [1 0 0 0];
D = 0;

[num,den] = ss2tf(A,B,C,D);

% Determin daca sistemul este stabil intern prin valorii proprii:
eig(A);     % Are toate valorile proprii cu partea reala < 0 => stabil intern

% Determin daca sistemul este stabil intern prin ecuatia lui Lyapunov:
P = lyap(A',eye(4));
eig(P);     % Valorile proprii sunt > 0 => stabil intern

% Determin daca sistemul este stabil extern:
roots(den); % Are toate solutiile cu partea reala < 0 => stabil extern

% Reprezentare grafica: 

sys = ss(A,B,C,D);
t = 0:1e-3:20;
u = ones(1,length(t));

[y,t,x]=lsim(sys,u,t);

figure, plot(t,x),title("Starile in timp:");
figure, plot(t,y),title("Raspunsul in timp:");