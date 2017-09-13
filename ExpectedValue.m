function [expected, variance, varCoef, fano] = ExpectedValue(shots)
    diffs = diff(shots);
    expected = mean(diffs);
    variance = var(diffs);
    sigma = sqrt(variance);
    % TODO: Hacerlo con los intervalos
    varCoef = sigma / expected;
    fano = variance / expected;
end

