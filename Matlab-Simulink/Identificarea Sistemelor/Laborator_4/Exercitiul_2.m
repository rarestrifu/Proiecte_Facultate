t = data(:,1);
u = data(:,2);
y = data(:,4);

plot(t,[u,y]), hold on;

i1 = 450;
i2 = 478;
i3 = 835;
i4 = 889;

u0 = mean(u(i1:i2));
y0 = mean(y(i1:i2));
ust = mean(u(i3:i4));
yst = mean(y(i3:i4));

K = (yst - y0)/(ust - u0);

plot(t,yst*ones(1,length(t)));
plot(t,y0*ones(1,length(t)));

i5 = 500;
i6 = 518;
i7 = 580;

tm = t(i6)-t(i5);
T = t(i7)-t(i6);

A = -1/T;
B = K/T;
C = 1;
D = 0;

sys = ss(A,B,C,D);

u2 = [u(1)*ones(i6-i5,1); u(1:length(u)-(i6-i5))];
ysim = lsim(sys,u2,t,y(1));
plot(t,ysim,'r');

eMPN = norm(y-ysim)/norm(y-yst);