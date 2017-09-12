function shots = PoissonGenerator(time, rate)
    shots = [];
    lastTime = 0;
    while (lastTime < time)
        lastTime = lastTime + NextTime(rate);
        if lastTime < time
            shots = [shots, lastTime];
        end
    end
end

function time = NextTime(rateParameter)
    time = -log(1 - rand) / rateParameter;
end
