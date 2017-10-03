load('c1p8.mat');
tao = 150;
C_t = StimulusMean(rho, stim, tao);
r_avg = sum(rho) * 2 / (20*60*1000); 
sigma_sq = var(stim);
D_t = C_t * r_avg / sigma_sq;

L_t = zeros(size(stim) - [tao, 0]);
for t = 1:length(L_t)
    L_t(t) = D_t' * stim(t:t+tao-1);
    L_t(t) = L_t(t)^2;
end

r0 = r_avg - mean(L_t);
r_est = r0 + L_t;

pred_spikes = GenerateSpikes(r_est); 
real_spikes = rho(tao+1:600000);
interval = 300;
total = floor(length(r_est)/interval)-1;
err = zeros(total, 1);
for i = 1:total
    start = i*interval;
    end_ = start + interval;
    pred_sum = sum(pred_spikes(start:end_));
    real_sum = sum(real_spikes(start:end_));
    err(i) = (pred_sum-real_sum) / interval;
end
plot(err);

% Plot for compare spikes in np samples.
figure();
np=300;
subplot(2,1,1)
stem(stim(1:np),real_spikes(1:np),'r');  % verdaderos
hold on
stem(stim(1:np),pred_spikes(1:np),'b'); % generados

% Creo que esto esta bien, pero no es lo que pide la consigna :P
figure();
rks = zeros(1,101);
for defasaje = 0:100
    rks(defasaje+1) = Correlation(pred_spikes, real_spikes, defasaje, mean(pred_spikes), mean(real_spikes));
end
plot(rks, 'x');

% figure();
% rks = zeros(1,101);
% for defasaje = 0:100
%     rks(defasaje+1) = Autocorrelation(pred_spikes, defasaje, mean(pred_spikes));
% end
% plot(rks, 'x');