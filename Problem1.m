shots = PoissonGenerator(10, 100);
[expected, var, varCoef, fano] = ExpectedValue(shots)
histogram(diff(shots));