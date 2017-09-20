load('c1p8.mat');
tao = 150;
C_t = StimulusMean(rho, stim, tao);
r_avg = sum(rho) / length(rho);
sigma_sq = var(stim);
D_t = C_t * r_avg / sigma_sq;
r_est = zeros(size(stim) - [tao, 0]);
r0 = -0.0295;
for t = 1:length(r_est)
    L_t = D_t' * stim(t:t+tao-1);
    r_est(t) = r0 + L_t^2;
end
rate = 1 / mean(r_est);

[spikes, times] = PoissonGenerator(20*60, rate, 1/500);
