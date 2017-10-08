function white_noise = UniformWhiteNoise(time, sigma, dt)
    b = sqrt(3/dt)*sigma;
    a = -b;
    m = ceil(time/dt);
    uniform_random = rand(m, 1);
    white_noise = a + (b-a) * uniform_random;
end