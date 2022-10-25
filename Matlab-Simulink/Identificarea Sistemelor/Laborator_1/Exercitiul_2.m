t = treapta0(:, 1);
u = treapta0(:, 2);
y = treapta0(:, 4);


%plot(t, u, t, y)
plot(t, [u, y]), hold on


i1 = 339;
i2 = 433;
i3 = 645;
i4 = 766;


u0 = mean(u(i1 : i2));
ust = mean(u(i3 : i4));
y0 = mean(y(i1 : i2));
yst = mean(y(i3 : i4));


K = (yst - y0)/(ust - u0);

ymax = 4.375;
delta = (ymax - yst)/(yst - y0);

ti = -log(delta)/sqrt(pi^2 + log(delta)^2);

i5 = 500;
i6 = 580;
Tosc = (t(i6) - t(i5))*2;
wosc = 2*pi/Tosc;

wn = wosc/sqrt(1-ti^2);

H = tf(K*wn^2,[1, 2*wn*ti, wn^2]);

% ysim = lsim(H, u, t);
% plot(t, ysim)

A = [0  1;
    -wn^2  -2*ti*wn];
B = [0;
    K*wn^2];
C = [1 0];
D = 0;
sys = ss(A, B, C, D);
ysim2 = lsim(sys, u, t,[y(1), y(1)]);
plot(t, ysim2)


%eroarea
J = sqrt(1/length(ysim2) * sum((y - ysim2).^2));
eMPN = norm(y - ysim2)/norm(y - mean(y));