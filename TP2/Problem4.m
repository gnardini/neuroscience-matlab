% % Is missing to use lambda 0.9 and lambda 0.99
[ref, stim, dv, v, delta, trials] = ReinforcementLearning(0.5, 260, 5);
plotParams(ref, stim, dv, v, delta, trials, 5);
plot3D(delta, trials, 5, 'Error de aprendizaje para L = 0.5');
[ref, stim, dv, v, delta, trials] = ReinforcementLearning(0.9, 260, 5);
plot3D(delta, trials, 5, 'Error de aprendizaje para L = 0.9');
[ref, stim, dv, v, delta, trials] = ReinforcementLearning(0.99, 260, 5);
plot3D(delta, trials, 5, 'Error de aprendizaje para L = 0.99');

function plotParams(r, u, dv, v, delta, trials, dt)
    delta = delta';
    totalSize = length(delta(1, :));
    time = (1:totalSize)* dt; 
    
    figure();
    subplot(5, 2, 1);
    plot(time, u(1:totalSize), '*');
    ylabel('u','fontsize',14);
    
    subplot(5, 2, 2);
    plot(time, u(1:totalSize), '*');
    ylabel('u','fontsize',14);
    
    subplot(5, 2, 3);
    plot(time, r(1:totalSize), '*');
    ylabel('r','fontsize',14);
    
    subplot(5, 2, 4);
    plot(time, r(1:totalSize), '*');
    ylabel('r','fontsize',14);
    
    subplot(5, 2, 5);
    plot(time, zeros(1, totalSize), '*');
    ylabel('v','fontsize',14);
    
    subplot(5, 2, 6);
    plot(time, v(1:totalSize), '*');
    ylabel('v','fontsize',14);
    
    subplot(5, 2, 7);
    plot(time, zeros(1, totalSize), '*');
    ylabel('dV','fontsize',14);
    
    subplot(5, 2, 8);
    plot(time, dv(1:totalSize), '*');
    ylabel('dV','fontsize',14);
    
    subplot(5, 2, 9);
    plot(time, delta(1, 1:totalSize), '*');
    xlabel('Tiempo [ms]','fontsize',14);
    ylabel('Delta','fontsize',14);
    
    subplot(5, 2, 10);
    plot(time, delta(trials, 1:totalSize), '*');
    xlabel('Tiempo [ms]','fontsize',14);
    ylabel('Delta','fontsize',14);
end

function plot3D(delta, trials, dt, graph_title)
    delta = delta';
    totalSize = length(delta(1, :));
    time = (1:totalSize)* dt;
  
    figure();
    surf(time, 1:trials, delta, 'LineStyle','none');
    title(graph_title,'fontsize',16);
    xlabel('Tiempo [ms]','fontsize',14);
    ylabel('Cantidad de intentos','fontsize',14);
    % Le faltan las unidades :/
    zlabel('Error','fontsize',12);
end