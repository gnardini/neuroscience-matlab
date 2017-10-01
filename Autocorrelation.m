function rk = Autocorrelation(noise, defasaje, exp)
    steps = size(noise);
    steps = steps(2);
    rk = 0;
    for i = (defasaje+1):steps
        rk = rk + (noise(i-defasaje)-exp) * (noise(i)-exp);
    end
end