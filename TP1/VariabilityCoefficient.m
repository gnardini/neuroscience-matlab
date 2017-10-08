function [ sigma, expected, varCoef ] = VariabilityCoefficient( shots )
%VARIABILITYCOEFFICIENT Summary of this function goes here
%   Detailed explanation goes here
    diffs = diff(shots);
    sigma = std(diffs);
    expected = mean(diffs);
    varCoef = sigma / expected;
end

