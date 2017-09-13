load('c1p8.mat');

% Con Tao variable (vale el tiempo entre disparos):
lastShot = 0;
rangeStim = 0;
averageStim = [];
for i = 1:size(rho)
    if rho(i) == 1
        timeBetween = i - lastShot;
        lastAverage = rangeStim / timeBetween;
        averageStim = [averageStim, lastAverage];
        rangeStim = 0;
        lastShot = i;
    else
        rangeStim = rangeStim + stim(i);
    end
end
mean(averageStim)

% Con tao entre 0 y 300ms (150 saltos de tiempo):
result = [];
% for tao = 1:150
for tao = 1:150
    current = zeros(tao,1);
    totalShots = 0;
    for i = (tao+1):size(rho)
        if rho(i) == 1
            totalShots = totalShots + 1;
            startRange = i-tao;
            endRange = i-1;
            current = current + stim(startRange:endRange);
        end
    end
    result = [result, mean(current)];
%     result = current;
end
plot(result)