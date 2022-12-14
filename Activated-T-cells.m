domain = [0 500];

Qo = 188;
To = 10;
Io = 0;
Vo = 10^(-6);


IC = [Qo To Io Vo];

[IVsol, DVsol] = ode45(@DEdef, domain, IC);


figure()
yyaxis left;
semilogy(IVsol, DVsol(:,4) * 10^(3), 'r')
axis([0 500 1 10^8])
ylabel("Viral Load")
title("Progression of CD4+ T cells and the viral load overtime");
xlabel("Time (days)")
hold on;

yyaxis right;
plot(IVsol, DVsol(:,1) + DVsol(:,2) + DVsol(:, 3), 'b');
ylabel("T-Lymphocytes CD4+ count")

ax = gca;
ax.YAxis(1).Color = 'r';
ax.YAxis(2).Color = 'b';


function [Ddv_div] = DEdef(I, D)
Q = D(1);
T = D(2);
I = D(3);
V = D(4);

r = 1;
Tmax = 1200;
alpha_q = 0.1;
dq = 0.001;
beta = 1.35*10^(-3);
gamma = 5.6*10^(-3);
di = 0.5;
p = 100;
c = 3;
