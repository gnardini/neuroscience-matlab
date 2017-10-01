function [noise, rks] = WhiteNoise(time, sigma, dt)
    noise = GenerateNoise(time, sigma, dt);
    [exp, var, fano] = ExpectedValue(noise);
    rks = zeros(1,11);
    for defasaje = 0:10
        rks(defasaje+1) = Autocorrelation(noise, defasaje, exp);
    end
end

function noise = GenerateNoise(time, sigma, dt)
    m  = ceil(time/dt);
    noise = zeros(m, 1);
    sigma = sigma / sqrt(dt);
    for i = 1 : m
		noise(i) = normrnd(0 ,sigma);
    end
end