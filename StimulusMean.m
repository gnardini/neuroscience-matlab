function stimMean = StimulusMean(rho, stim, tao)
    stimMean = zeros(tao,1);
    totalShots = 0;
    for i = (tao+1):size(rho)
        if rho(i) == 1
            totalShots = totalShots + 1;
            startRange = i-tao;
            endRange = i-1;
            stimMean = stimMean + stim(startRange:endRange);
        end
    end
    stimMean = stimMean / totalShots;
end
