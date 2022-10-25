t = treapta0(:, 1);
u = treapta0(:, 2);
y = treapta0(:, 3);


%plot(t, u, t, y)
plot(t, [u, y]), hold on


i1 = 313;
i2 = 406;
i3 = 652;
i4 = 756;


u0 = mean(u(i1 : i2));
ust = mean(u(i3 : i4));
y0 = mean(y(i1 : i2));
yst = mean(y(i3 : i4));


K = (yst - y0)/(ust - u0);


y63 = y0 + 0.63*(yst - y0);
plot(t, y63 * ones(1, length(t)), '--g'), hold on


 i5 = 500;
 i6 = 509;


T = t(i6) - t(i5);


H = tf(K, [T, 1]);


% ysim = lsim(H, u, t);
% plot(t, ysim)

A = -1/T;
B = K/T;
C = 1;
D = 0;
sys = ss(A, B, C, D);
ysim2 = lsim(sys, u, t, y(1));
plot(t, ysim2)


%eroarea
J = sqrt(1/length(ysim2) * sum((y - ysim2).^2));
eMPN = norm(y - ysim2)/norm(y - mean(y));