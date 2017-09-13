load('c1p8.mat');
result = [];
for tao = 1:150
    stimMean = StimulusMean(rho, stim, tao);
    result = [result, mean(stimMean)];
    result = stimMean;
end
plot(result)
