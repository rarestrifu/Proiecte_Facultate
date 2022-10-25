t = impuls0(:,1);
u = impuls0(:,2);
y = impuls0(:,4);

plot(t,[u,y]), hold on

i1 = 425;
i2 = 474;

ust = mean(u(i1:i2));
yst = mean(y(i1:i2));

plot(t,yst*ones(length(t)),'g');

K = yst/ust;

i3 = 237;
i4 = 334;
i5 = 500;
Ts = t(2)-t(1);

Ap = sum(y(i3:i4)-yst)*Ts;
Am = sum(yst-y(i4:i5))*Ts;

sigma = Am/Ap;
zeta = -log(sigma)/sqrt(pi*2+log(sigma)^2);

i7 = 262;
i8 = 372;

Tosc = (t(i8)-t(i7))*2;
wosc = 2*pi/Tosc;
wn = wosc/sqrt(1-zeta^2);

A = [0 1; -wn^2 -2*zeta*wn];
B = [0; K*wn^2];
C = [1 0];
D = 0;

sys = ss(A,B,C,D);
ysim = lsim(sys,u,t,[y(1), -1500]);
plot(t,ysim);

%eroarea
J = sqrt(1/length(ysim) * sum((y - ysim).^2));
eMPN = norm(y - ysim)/norm(y - mean(y));