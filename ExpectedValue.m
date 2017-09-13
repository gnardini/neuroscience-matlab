function [expected, var, varCoef, fano] = ExpectedValue(shots)
    diffs = diff(shots);
    total = sum(diffs);
    length = size(shots);
    length = length(2);
    expected = total / length;
    diffs = diffs.^2;
    total = sum(diffs);
    var = total / length - expected^2;
    sigma = sqrt(var);
    % TODO: Hacerlo con los intervalos
    varCoef = sigma / expected;
    fano = var / expected;
end

