load('tuning.mat');

% 
% Plot means of rates and function to fit it.
% 
neuron_count = 4;
r_maxs = zeros(neuron_count, 1);
r_maxs_position = zeros(neuron_count, 1);
neurons = [mean(neuron1); mean(neuron2); mean(neuron3); mean(neuron4)];
for j = 1:neuron_count
    [r_maxs(j), r_maxs_position(j)] = max(neurons(j, :));
end

% Get c coeffcients

c = c_values();
s = EstimatedStim(neuron1, neuron2, neuron3, neuron4, r_maxs, c);
err = abs(stim - s);

% figure();
% plot (stim, err, 'x');
% hold on
% plot (stim, err, 'Color', 'r');

figure();
% plot(s, stim, 'x');

% 
% % Graph of means of neurons 
 hold on 
 plot(stim, mean(neuron1) / r_maxs(1), 'r');
 plot(stim, mean(neuron2) / r_maxs(2), 'b');
 plot(stim, mean(neuron3) / r_maxs(3), 'g');
 plot(stim, mean(neuron4) / r_maxs(4), 'm');
% 
% % Add cos as fit function
% 
y1 = cosd(stim - stim(r_maxs_position(1)));
y1(y1<0) = 0;
y2 = cosd(stim - stim(r_maxs_position(2)));
y2(y2<0) = 0;
y3 = cosd(stim - stim(r_maxs_position(3)));
y3(y3<0) = 0;
y4 = cosd(stim - stim(r_maxs_position(4)));
y4(y4<0) = 0;
% 
plot(stim, y1, '*', 'Color', 'r');
plot(stim, y2, '*', 'Color', 'b');
plot(stim, y3, '*', 'Color', 'g');
plot(stim, y4, '*', 'Color', 'm');
% 
% % TODO: is missing to test with liean function or gauss.
% 
% % 
% % Verify poisson distribution
% % 
% 
% Neuron 1
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


% Generate rates

% Population vector

function vpop = PopulationVector(means, r_max, c)
    [differentsNeurons, s_size] = size(means);
    vpop = zeros(s_size, 2);
    for i = 1:differentsNeurons
        vpop = vpop + means(i, :)' / r_max(i) * c(i, :);
    end
end

function s = EstimatedStim(neuron1, neuron2, neuron3, neuron4, r_max, c)
    means = [mean(neuron1); mean(neuron2); mean(neuron3); mean(neuron4)];
    vpop = PopulationVector(means, r_max, c);
    s = mod(atan2d(vpop(: , 2),vpop(: ,1)) + 360, 360)'
end

function c = c_values()
    % falta aclarar que son los valores que maximizan cada una de las neuronas.      
	c1 = [cosd(45), sind(45)];
    c2 = [-cosd(45), sind(45)];
    c3 = [-cosd(45), -sind(45)];
    c4 = [cosd(45), -sind(45)];
    % no hace falta calcular la norma porque al trabajar con senos y cosenos ya tiene norma 1.     
    c = [c1; c2; c3; c4];
end