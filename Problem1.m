expected = [];
variance = [];
sigma = [];
varCoef = [];
fano = [];
for i = 1:1:100
    deltaTime = i /1000.0; % pasar a segundos.
    [spikes, times] = PoissonGenerator(10, 100, deltaTime);
    diffs = diff(times);
    mean1 = mean(spikes);
    if ~isnan(mean1)
        expected = [expected, mean1];
        variance = [variance, var(spikes)];
        sigma = [sigma, std(diffs)];
        fanoo = var(spikes) / mean(spikes);
%         Falta extrapolarlo a un gráfico. Arreglar un poco esto que es
%         horrible
        varCoef = [varCoef, std(diffs) / mean(diffs)]; 
        fano = [fano, fanoo];
    end
end

% histogram(acumulated, 100);

% plot(varCoef, 'x');


p = polyfit(expected, variance, 1)
y1 = polyval(p,expected);
  
plot(expected, variance,'o');
hold on 
plot(expected,y1)
hold off

