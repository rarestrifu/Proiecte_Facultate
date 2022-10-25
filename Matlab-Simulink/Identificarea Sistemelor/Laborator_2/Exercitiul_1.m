
t = impuls0(:,1);
u = impuls0(:,2);
y = impuls0(:,3);

plot(t,[u,y]), hold on

i1 = 400;
i2 = 454;

ust = mean(u(i1:i2));
yst = mean(y(i1:i2));

K = yst/ust;

ymax = 3.438;
y37 = yst + 0.37*(ymax-yst);

plot(t,y37*ones(length(t)));

i3 = 236;
i4 = 250;

T = t(i4)-t(i3);

A = -1/T;
B = K/T;
C = 1;
D = 0;

sys = ss(A,B,C,D);
ysim = lsim(sys,u,t,y(1));
plot(t, ysim,'g');

%eroarea
J = sqrt(1/length(ysim) * sum((y - ysim).^2));
eMPN = norm(y - ysim)/norm(y - mean(y));