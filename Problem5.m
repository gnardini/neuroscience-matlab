correctness = zeros(11, 1);
for d = 0:10
    x = binornd(1, .5, 1000, 1);
    stim = zeros(1000,1);
    umbral = 20 + 5*d;
    for i = 1:size(x)
        e = normrnd(0, 10);
        if x(i) == 0
            stim(i) = 20 + e;
        else
            stim(i) = 20 + e + 10*d;
        end
        if stim(i) < 0
            stim(i) = 0;
        end
        if stim(i) > umbral && x(i) == 1
            stim(i) = 1;
        elseif stim(i) < umbral && x(i) == 0
            stim(i) = 1;
        else
            stim(i) = 0;
        end
    end
    correctness(d+1) = mean(stim);
end
correctness
PlotValue(correctness, 'Discriminación de puntos aleatorios', 'd (Discriminabilidad)', 'Porcentaje de respuestas correctas');