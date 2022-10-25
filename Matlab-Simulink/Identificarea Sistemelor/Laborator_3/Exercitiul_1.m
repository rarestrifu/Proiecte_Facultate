t = scope130(:,1);
u = scope130(:,2);
y = scope130(:,3);

figure(1)
plot(t,[u,y]), hold on;

i1 = 378;
i2 = 439;

yst = mean(y(i1:i2));
ust = mean(u(i1:i2));
k = yst/ust;

plot(t,yst*ones(1,length(t)),'g');

i3 = 61;
i4 = 205;

y_log = log(y(i3:i4)-yst);
t_log = t(i3:i4);

figure(2)
plot(t_log,y_log);

i5 = 62;
i6 = 74;

alpha = (y_log(i6) - y_log(i5))/(t(i6) - t(i5));
T = -1/alpha;

a11 = sum(t_log.^2);
a12 = sum(t_log);
a21 = sum(t_log);
a22 = length(t_log);
b1 = sum(y_log.*t_log);
b2 = sum(y_log);
abv = inv([a11, a12;a21, a22])*[b1;b2];
T1 = -1/abv(1);

A = -1/T1;
B = k/T1;
C = 1;
D = 0;
sys = ss(A,B,C,D);
ysim = lsim(sys,u,t,y(1));
figure(1)
plot(t,ysim);

eMPN = norm(y-ysim)/norm(y-mean(y));