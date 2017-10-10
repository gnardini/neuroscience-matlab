% Problem 2 code for part a
% I should be in nA
Iapp = [0.01:0.001:3].* 10e-9;
rates_i = zeros(size(Iapp));

Gl = [0.01:0.001:3].*10e9;
rates_g = zeros(size(Gl));

for i = 1:length(rates_i)
    rates_i(i) = Rate_i(Iapp(i));
    rates_g(i) = Rate_g(Gl(i));
end

figure();
plot(Iapp, rates_i);

figure();
plot(Gl, rates_g);

% TODO: Revisar
function r = Rate_i(i)
    Rm = 10e6;
    Vreset = -80e-3;
    Vth = -40e-3;
    Ve = -70e-3;
    Taum = 10e-3;
    r = 0;
    if (Vth < Ve + i * Rm)
        r = (-Taum * log((Vth - Ve - i * Rm) / ((Vreset - Ve - i * Rm))))^-1;
    end
end

% Problem 2 code for part b
function r = Rate_g(g)
%     Vreset = -80e-3;
    Vreset = -60e-3;
    Vth = -40e-3;
    Ve = -70e-3;
    Cm = 10e-3 / 10e6;
    l = log((Vth - Ve) / (Vreset - Ve));
    r = (-Cm / g * l)^-1;
end