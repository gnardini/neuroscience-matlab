function [variance, expected, fano] = ExpectedValue( spikes )
    expected = mean(spikes);
    variance = var(spikes);    
    fano = variance / expected;
end

