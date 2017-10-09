% Problem 2 code for part a
% I should be in nA
Iapp = [0.01:0.001:3].* 10e-9;
rates = zeros(size(Iapp));
for i = 1:length(rates)
    rates(i) = Rate(Iapp(i));
end
plot(Iapp, rates);

% TODO: Revisar
function r = Rate(i)
    Rm = 10e6;
    Vreset = -80e-3;
    Vth = -40e-3;
    Ve = -70e-3;
    Taum = 10e-3;
    r = 0;
    if (Vreset < Ve + i * Rm)
        r = (-Taum * log((Vth - Ve - i * Rm) / ((Vreset - Ve - i * Rm))))^-1;
    end
end

% Problem 2 code for part b
