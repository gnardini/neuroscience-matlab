% Normal Noise
[n_noise, n_rks] = WhiteNoise(10, 2, .01);
figure();
plot(n_noise);
title('Ruido blanco gausiano','fontsize', 14);
xlabel('Tiempo [ms]','fontsize', 12);
ylabel('Respuesta','fontsize', 12);

figure();
stem(n_rks);
title('Autocorrelación en función del desfasaje - gausiano','fontsize', 14);
xlabel('Desfasaje','fontsize', 12);
ylabel('Autocorrelación','fontsize', 12);

% Uniform Noise
u_noise = UniformWhiteNoise(10, 2, .01);
u_rks = zeros(1,11);
[exp, var, fano] = ExpectedValue(u_noise);
for defasaje = 0:10
    u_rks(defasaje+1) = Autocorrelation(u_noise, defasaje, exp);
end
figure();
plot(u_noise);
title('Ruido blanco uniforme','fontsize', 14);
xlabel('Tiempo [ms]','fontsize', 12);
ylabel('Respuesta','fontsize', 12);

figure();
stem(u_rks);
title('Autocorrelación en función del desfasaje - uniforme','fontsize', 14);
xlabel('Desfasaje','fontsize', 12);
ylabel('Autocorrelación','fontsize', 12);