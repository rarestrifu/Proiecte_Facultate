t = data(:,1);
u = data(:,2);
y = data(:,3);

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

plot(t,yst*ones(1,length(t)))

i4 = 498;
i5 = 564;

T = t(i5)-t(i4);

A = [-1/T];
B = [K/T];
C = 1;
D = 0;

sys = ss(A,B,C,D);
ysim = lsim(sys,u,t,y(1));
plot(t,ysim,'r');