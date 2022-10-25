t = scope128(:,1);
u = scope128(:,2);
y = scope128(:,4);

figure(1);
plot(t,[u,y]), hold on;

i1 = 354;
i2 = 440;
i3 = 631;
i4 = 741;

u0 = mean(u(i1:i2));
y0 = mean(y(i1:i2));
ust = mean(u(i3:i4));
yst = mean(y(i3:i4));

K = (yst - y0)/ (ust - u0);

plot(t,yst*ones(1,length(t)),'g');

i5 = 501;
i6 = 636;

y_log = log(yst-y(i5:i6));
tk = t(i5:i6);

a11 = sum(tk.^2);
a12 = sum(tk);
a21 = sum(tk);
a22 = length(tk);
b1 = sum(y_log.*tk);
b2 = sum(y_log);
abv = inv([a11, a12;a21, a22])*[b1;b2];

T = -1/abv(1);

A = -1/T;
B = K/T;
C = 1;
D = 0;
sys = ss(A,B,C,D);
ysim = lsim(sys,u,t,y(1));
figure(1)
plot(t,ysim);

eMPN = norm(y-ysim)/norm(y-mean(y));