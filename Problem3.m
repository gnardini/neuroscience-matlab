load('c1p8.mat');
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