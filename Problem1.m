maxInterval = 100;
fanoComponents =zeros(maxInterval, 2);
varCoefComponents = zeros(maxInterval, 2);
varCoef = zeros(maxInterval, 1);
fano = zeros(maxInterval, 1);
diffsShots = [];
for i = 1:maxInterval
    % Change time to ms. 
    deltaTime = i /1000.0; 
    [spikes, shots] = PoissonGenerator(10, 100, deltaTime);
    [varCoefComponents(i, 1), varCoefComponents(i, 2), varCoef(i)] = VariabilityCoefficient(shots);
    [fanoComponents(i, 1), fanoComponents(i, 2), fano(i)] = ExpectedValue(spikes);
    diffsShots = [diffsShots, diff(shots)];
end

% Plots
figure(); 
histogram(diffsShots);

figure(); 
histogram(spikes);
sum(spikes)

figure(); 
FunctionPlot(varCoefComponents(:, 2), varCoefComponents(:, 1), 'Coeficiente de Variación', 'Esperanza', 'Desvío estándar');

figure(); 
FunctionPlot(fanoComponents(:, 2), fanoComponents(:, 1), 'Coeficiente de Fano', 'Esperanza', 'Varianza');

