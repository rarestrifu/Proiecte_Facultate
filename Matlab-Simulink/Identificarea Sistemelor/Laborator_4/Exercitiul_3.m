
plot(t,[u,y]), hold on;

i1 = 435;
i2 = 501;
i3 = 839;
i4 = 905;

u0 = mean(u(i1:i2));
y0 = mean(y(i1:i2));
yst = mean(y(i3:i4));
ust = mean(u(i3:i4));

K = (yst-y0)/(ust-u0);

y28 = y0 + 0.28*(yst-y0);
y63 = y0 + 0.63*(yst-y0);

plot(t,y28*ones(1,length(t)));
plot(t,y63*ones(1,length(t)));

i5 = 503;
i6 = 542;
i7 = 587;

t28 = t(i6)-t(i5);
t63 = t(i7)-t(i5);

T = 1.5*(t63-t28);
tm = 1.5*(t28-1/3*t63);

A = -1/T;
B = K/T;
C = 1;
D = 0;

nidx = round(tm/(t(2)-t(1)));
sys = ss(A,B,C,D);
u2 = [u(1)*ones(nidx,1); u(1:length(u)-(nidx))];
ysim = lsim(sys,u2,t,y(1));
plot(t,ysim,'r');

eMPN = norm(y-ysim)/norm(y-yst);