function [noise, rks] = WhiteNoise(time, dt)
    noise = GenerateNoise(time, dt) - .5;
    [exp, var, fano] = ExpectedValue(noise);
    rks = zeros(1,11);
    for defasaje = 0:10
        rks(defasaje+1) = Autocorrelation(noise, defasaje, exp);
    end
end

function rk = Autocorrelation(noise, defasaje, exp)
    steps = size(noise);
    steps = steps(2);
    rk = 0;
    for i = (defasaje+1):steps
        rk = rk + (noise(i-defasaje)-exp) * (noise(i)-exp);
    end
end

function noise = GenerateNoise(time, dt)
    current = 0;
    noise = [];
    while (current < time)
        current = current + dt;
        noise = [noise, rand];
    end
end