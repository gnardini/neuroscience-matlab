function [spikes, shots] = PoissonGenerator(time, rate, dt)
    shots = [];
    lastTime = 0;
    lambda = rate * dt;
    while lastTime <= time
        lastTime = lastTime + NextTime(lambda);
        if lastTime < time
            shots = [shots, lastTime];
        end
    end
    spikes = GenerateSpikes(shots, time, dt);
end

function time = NextTime(rateParameter)
    time = -log(1 - rand) / rateParameter;
end

% function spikes = GenerateSpikes(shots, time, dt)
%     spikes = [];
%     shotPosition = 1;
%     [row, shotSize] = size(shots);
%     for i = 1:dt:time
%         value = 0;
%         if shotPosition <= shotSize
%             if shots(shotPosition) < i
%                 value = 1;
%                 shotPosition = shotPosition + 1;
%             end
%         end
%         spikes = [spikes, value];
%     end
% end


function spikes = GenerateSpikes(shots, time, dt)
    spikes = zeros(ceil(time / dt), 1);
    for i = shots
        j = ceil(i / dt);
        aux = spikes(j);
        spikes(j) = aux + 1;
    end
end

