function noise = WhiteNoise(time, dt)
    noise = GenerateNoise(time, dt)
    [exp, var, coef, fano] = ExpectedValue(noise);
end

function noise = GenerateNoise(time, dt)
    current = 0;
    noise = [];
    while (current < time)
        current = current + dt;
        noise = [noise, rand];
    end
end