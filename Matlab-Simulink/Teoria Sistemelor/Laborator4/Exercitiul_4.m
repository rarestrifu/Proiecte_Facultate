% Tema laborator 4
% a)
t = 0:0.0001:100;
u_a = @(t)(t==0)*2;
sys_a = tf(5,[1,3,2]);
y_a = @(t)(10*(exp(-t)-exp(-2*t)));
fplot(y_a,[0 100],'r');
hold on
lsim(sys_a,u_a(t),t);
figure;

% b)
%u_b = @(t)(3);
%sys_b = tf([1,0],[1,6,8]);
%y_b = @(t)(6*t - 3 + exp(-2*t) + 2 * exp(-t));
%fplot(y_b,[0 100],'r');
%hold on
%lsim(sys_b,u_b(t),t);
%figure;

% c)
u_c = @(t)(t==0)+2;
sys_c = tf(1,[1,2,5]);
y_c = @(t)(2/5-2/5*exp(-t)*cos(2*t)+3/10*exp(-t)*sin(2*t));
fplot(y_c,[0 100],'r');
hold on
lsim(sys_c,u_c(t),t);
figure;

% d)
u_d = @(t)(t==0)*2+1;
sys_d = tf([1,8],[1,-2,5]);
y_d = @(t)(8/5+2/5*exp(t)*cos(2*t)+103/10*exp(t)*sin(2*t));
fplot(y_d,[0 100],'r');
hold on
lsim(sys_d,u_d(t),t);
figure;

% e)
u_e = @(t)(2*t);
sys_e = tf([1,2,2],[1,3,2]);
y_e = @(t)(6*t-3+exp(-2*t)+2*exp(-t));
fplot(y_e,[0 100],'r');
hold on
lsim(sys_e,u_e(t),t);
figure;

% f)
u_f = @(t)(t==0);
sys_f = tf(2,[1,0,5]);
y_f = @(t)(2/sqrt(5)*sin(sqrt(5)*t));
fplot(y_f,[0 100],'r');
hold on
lsim(sys_f,u_f(t),t);
figure;

% g)
% u_g = @(t)(2);
% sys_g = tf([1,1],[1,2,-3]);
% y_g = @(t)(exp(t)-1/3*exp(-3*t)-2/3);
% fplot(y_g,[0 100],'r');
% hold on
% lsim(sys_g,u_g(t),t);

% h)
u_h = @(t)(t.*t);
sys_h = tf(2,[1,3,2]);
y_h = @(t)(8*exp(-t)-5/2*exp(-2*t)-11/2+3*t+t*t);
fplot(y_h,[0 100],'r');
hold on
lsim(sys_h,u_h(t),t);
figure;

% i)
u_i = @(t)(t==0)*2;
sys_i = tf([1,-5],[1,3,3,1]);
y_i = @(t)((2*t-6*t*t)*exp(-t));
fplot(y_i,[0 100],'r');
hold on
lsim(sys_i,u_i(t),t);
figure;

% j)
u_j = @(t)(t-5);
sys_j = tf(5,[1,1,1,0]);
y_j = @(t)((5/24*t^4 - 25/6*t^3)*exp(t));
fplot(y_j,[0 100],'r');
hold on
lsim(sys_j,u_j(t),t);


