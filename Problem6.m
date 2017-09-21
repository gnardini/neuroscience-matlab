load('tuning.mat');

% 
% Plot means of rates and function to fit it.
% 
[max_num_1, max_idx_1] = max(mean(neuron1));
[max_num_2, max_idx_2] = max(mean(neuron2));
[max_num_3, max_idx_3] = max(mean(neuron3));
[max_num_4, max_idx_4] = max(mean(neuron4));

% Graph of means of neurons 
hold on 
plot(stim, mean(neuron1) / max_num_1, 'r');
plot(stim, mean(neuron2) / max_num_2, 'b');
plot(stim, mean(neuron3) / max_num_3, 'g');
plot(stim, mean(neuron4) / max_num_4, 'm');

% Add cos as fit function

y1 = cosd(stim - stim(max_idx_1));
y1(y1<0) = 0;
y2 = cosd(stim - stim(max_idx_2));
y2(y2<0) = 0;
y3 = cosd(stim - stim(max_idx_3));
y3(y3<0) = 0;
y4 = cosd(stim - stim(max_idx_4));
y4(y4<0) = 0;

plot(stim, y1, '*', 'Color', 'r');
plot(stim, y2, '*', 'Color', 'b');
plot(stim, y3, '*', 'Color', 'g');
plot(stim, y4, '*', 'Color', 'm');

% TODO: is missing to test with liean function or gauss.

% 
% Verify poisson distribution
% 

% Neuron 1
figure(); 
expected1 = mean(neuron1);
variance1 = var(neuron1);
FunctionPlot(expected1, variance1, 'Neuron 1', 'Mean', 'Var');

% Neuron 2
figure(); 
expected2 = mean(neuron2);
variance2 = var(neuron2);
FunctionPlot(expected2, variance2, 'Neuron 2', 'Mean', 'Var');

% Neuron 3 - This is not poisson?? TODO: is necessary more information? is
% enough 
figure(); 
expected3 = mean(neuron3);
variance3 = var(neuron3);
FunctionPlot(expected3, variance3, 'Neuron 3', 'Mean', 'Var');

% Neuron 4
figure(); 
expected4 = mean(neuron4);
variance4 = var(neuron4);
FunctionPlot(expected4, variance4, 'Neuron 4', 'Mean', 'Var');
