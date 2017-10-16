Im = 1e-9;
Rm = 1 / (25e-9);
dt = 0.2e-3;
Vreset = -60e-3;
Vth = -54e-3;
Ve = -70e-3;
Cm = 500e-12;
total_spikes = 10;
amount_spikes = 0;

spikes = zeros(1000, 1);
time = zeros(1000, 1);
spikes(1) = Ve; 

V_inf = Ve + Im * Rm;
Tau_V = Cm * Rm;
pre_exp = exp(- dt / Tau_V);
end_position = length(spikes);
for i = 2:length(spikes)
    time(i) = time(i-1) + dt;
    if spikes(i-1) >= Vth
        spikes(i) = Vreset; 
        amount_spikes = amount_spikes + 1;
        if amount_spikes == total_spikes
            end_position = i;
            break;
        end
    else
        spikes(i) = V_inf + (spikes(i-1) - V_inf) * pre_exp;
    end
end 
plot(time(1 : end_position), spikes(1 : end_position));
