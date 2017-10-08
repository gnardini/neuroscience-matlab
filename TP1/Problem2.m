% Normal Noise
[n_noise, n_rks] = WhiteNoise(10, 2, .01);
figure();
plot(n_noise, 'Color', StandarColor());
title('Ruido blanco gausiano','fontsize', 14);
xlabel('dt = 10[ms]','fontsize', 12);
ylabel('Estímulo','fontsize', 12);

figure();
stem([0:10], n_rks, 'Color', StandarColor());
title('Autocorrelación en función del defasaje - gausiano','fontsize', 14);
xlabel('Defasaje - pasos de tiempo','fontsize', 12);
ylabel('Autocorrelación','fontsize', 12);

% Uniform Noise
u_noise = UniformWhiteNoise(10, 2, .01);
u_rks = zeros(1,11);
[exp, var, fano] = ExpectedValue(u_noise);
for defasaje = 0:10
    u_rks(defasaje+1) = Autocorrelation(u_noise, defasaje, exp)
end
figure();
plot(u_noise, 'Color', StandarColor());
title('Ruido blanco uniforme','fontsize', 14);
xlabel('dt = 10[ms]','fontsize', 12);
ylabel('Estímulo','fontsize', 12);

figure();
stem([0:10], u_rks, 'Color', StandarColor());
title('Autocorrelación en función del defasaje - uniforme','fontsize', 14);
xlabel('Defasaje - pasos de tiempo','fontsize', 12);
ylabel('Autocorrelación','fontsize', 12);