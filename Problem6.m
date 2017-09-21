load('tuning.mat');

% 
% Plot means of rates and function to fit it.
% 
[max_num_1, max_idx_1] = max(mean(neuron1));
[max_num_2, max_idx_2] = max(mean(neuron2));
[max_num_3, max_idx_3] = max(mean(neuron3));
[max_num_4, max_idx_4] = max(mean(neuron4));

% Get c coeffcients
c1 = c_values(stim(max_idx_1));
c2 = c_values(stim(max_idx_2));
c3 = c_values(stim(max_idx_3));
c4 = c_values(stim(max_idx_4));
c = [c1; c2; c3; c4];
r_max = [max_num_1, max_num_2, max_num_3, max_num_4];
s = EstimatedStim(neuron1, neuron2, neuron3, neuron4, r_max, c);
stim - s
% 
% % Graph of means of neurons 
% hold on 
% plot(stim, mean(neuron1) / max_num_1, 'r');
% plot(stim, mean(neuron2) / max_num_2, 'b');
% plot(stim, mean(neuron3) / max_num_3, 'g');
% plot(stim, mean(neuron4) / max_num_4, 'm');
% 
% % Add cos as fit function
% 
% y1 = cosd(stim - c(1));
% y1(y1<0) = 0;
% y2 = cosd(stim - c(2));
% y2(y2<0) = 0;
% y3 = cosd(stim - c(3));
% y3(y3<0) = 0;
% y4 = cosd(stim - c(4));
% y4(y4<0) = 0;
% 
% plot(stim, y1, '*', 'Color', 'r');
% plot(stim, y2, '*', 'Color', 'b');
% plot(stim, y3, '*', 'Color', 'g');
% plot(stim, y4, '*', 'Color', 'm');
% 
% % TODO: is missing to test with liean function or gauss.
% 
% % 
% % Verify poisson distribution
% % 
% 
% % Neuron 1
% figure(); 
% expected1 = mean(neuron1);
% variance1 = var(neuron1);
% FunctionPlot(expected1, variance1, 'Neuron 1', 'Mean', 'Var');
% 
% % Neuron 2
% figure(); 
% expected2 = mean(neuron2);
% variance2 = var(neuron2);
% FunctionPlot(expected2, variance2, 'Neuron 2', 'Mean', 'Var');
% 
% % Neuron 3 - This is not poisson?? TODO: is necessary more information? is
% % enough 
% figure(); 
% expected3 = mean(neuron3);
% variance3 = var(neuron3);
% FunctionPlot(expected3, variance3, 'Neuron 3', 'Mean', 'Var');
% 
% % Neuron 4
% figure(); 
% expected4 = mean(neuron4);
% variance4 = var(neuron4);
% FunctionPlot(expected4, variance4, 'Neuron 4', 'Mean', 'Var');


% aasd = stim - mod(vpop, 360)
% abs(stim - mod(mod(vpop, 360) + 360, 360))

% Generate rates

% Population vector

function vpop = PopulationVector(neuron1, neuron2, neuron3, neuron4, r_max, c)
    neuron1 = neuron1' / r_max(1) * c(1, :);
    neuron2 = neuron2' / r_max(2) * c(2, :);
    neuron3 = neuron3' / r_max(3) * c(3, :);
    neuron4 = neuron4' / r_max(4) * c(4, :);
    vpop = neuron1 + neuron2 + neuron3 + neuron4;
end

function s = EstimatedStim(neuron1, neuron2, neuron3, neuron4, r_max, c)
    vpop = PopulationVector(mean(neuron1), mean(neuron2), mean(neuron3), mean(neuron4), r_max, c);
    s = mod(atan2d(vpop(: , 2),vpop(: ,1))' + 360, 360)
end

function c = c_values(tita)
	v = [1,0];
	tita = - tita;
	R = [cosd(tita),-sind(tita);sind(tita),cosd(tita)];
	c = (v * R);
	c = c / norm(c);

end
