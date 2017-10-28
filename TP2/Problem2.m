% Problem 2 code for part a
% I should be in nA
Iapp = [0.01:0.001:3].* 10e-10;
rates_i = zeros(size(Iapp));

Gl = [0.01:0.001:3].*10e-7;
rates_g = zeros(size(Gl));

for i = 1:length(rates_i)
    rates_i(i) = Rate_i(Iapp(i));
    rates_g(i) = Rate_g(Gl(i));
end

figure();
plot(Iapp, rates_i);
title("Tasa de disparo en función de la corriente",'fontsize', 16);
xlabel("Iapp [A]",'fontsize', 14);
ylabel("r [Hz]",'fontsize', 14);

figure();
plot(Gl, rates_g);
title("Tasa de disparo en función de la conductancia sináptica",'fontsize', 16);
xlabel("gsym [S]",'fontsize', 14);
ylabel("r [Hz]",'fontsize', 14);

% TODO: Revisar
function r = Rate_i(i)
    Rm = 90e6;
    Vreset = -65e-3;
    Vth = -50e-3;
    Ve = -65e-3;
    Taum = 10e-3;
    r = 0;
    if (Vth < Ve + i * Rm)
        r = (-Taum * log((Vth - Ve - i * Rm) / ((Vreset - Ve - i * Rm))))^-1;
    end
end

% Problem 2 code for part b
function r = Rate_g(g)
    Vreset = -65e-3;
    Vth = -50e-3;
    Ve = -65e-3;
    Rm = 90e6;
    Tm = 10e-3;
    gmTerm = 1 + g* Rm;
    Vsyn = -55e-3;
    r=0;
    log_argument = abs((gmTerm*Vth - Ve - g* Rm*Vsyn) / (gmTerm*Vreset - Ve - g* Rm*Vsyn));
    if (log_argument > 0 && log_argument < 1)
        r = (-Tm / gmTerm * log(log_argument))^-1;
    end
end