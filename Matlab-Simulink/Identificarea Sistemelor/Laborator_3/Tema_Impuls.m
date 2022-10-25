t = scope130(:,1);
u = scope130(:,2);
y = scope130(:,4);

plot(t,[u,y]), hold on;

i1 = 447;
i2 = 495;

ust = mean(u(i1:i2));
yst = mean(y(i1:i2));

K = -yst/ust;

plot(t,yst*ones(1,length(t)));

i5 = 540;
i6 = 760;
i7 = 864;
tk1 = t(i5:i6);
tk2 = t(i6:i7);

y_log1 = log(y(i5:i6));
a11 = sum(tk1.^2);
a12 = sum(tk1);
a21 = sum(tk1);
a22 = sum(length(tk1));
b1 = sum(y_log1.*tk1);
b2 = sum(y_log1);
abv = inv([a11 a12; a21 a22])*[b1;b2];

T1 = -1/abv(1);

y_log2 = log(y(i6:i7));
a11 = sum(tk2.^2);
a12 = sum(tk2);
a21 = sum(tk2);
a22 = sum(length(tk2));
b1 = sum(y_log2.*tk2);
b2 = sum(y_log2);
abv = inv([a11 a12; a21 a22])*[b1;b2];

T2 = -1/abv(1);

A = [0 1; -1/T1/T2 -1/T1-1/T2];
B = [0; K/T1/T2];
C = [1 0];
D = 0;

sys = ss(A,B,C,D);
ysim = lsim(sys,u,t,[y(1),0]);
plot(t,ysim);
eMPN = norm(y-ysim)/norm(y-mean(y))