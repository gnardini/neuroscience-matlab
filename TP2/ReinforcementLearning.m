function [ref, stim, dv, v, delta, trials] = ReinforcementLearning(lambda, totalTime, dt)
    size = ceil(totalTime / dt);
    v = zeros(1, size);
    dv = zeros(1, size);
    u_ = zeros(1, (size-1));
    w = zeros(1, (size-1));
    delta = zeros((size-1), 1);
    
    ref = r(dt, totalTime);
    stim = u(dt, totalTime);
    
    epsilon = 0.2;
    trials = 0;
    while(trials<=1 || norm(delta(:,trials)-delta(:,trials-1))>1e-5)
        trials = trials+1;
        for t = 2:(size-1)
            u_(t) = lambda * u_(t-1) + (1-lambda) * stim(t);
            v(t) = w(1:t) * stim(t:-1:1)';
            dv(t) = v(t+1) - v(t);
            delta(t,trials)=  ref(t) +  dv(t);
            w(1:t) =  w(1:t) + epsilon * delta(t,trials) * u_(t:-1:1); 	
        end
    end
end

function stim = u(dt, totalTime)
    steps = ceil(totalTime / dt);
    stim = zeros(1, steps);
    for t = 1:steps
        stim(t) = ((t*dt) == 100);
    end
end

function ref = r(dt, totalTime)
    steps = ceil(totalTime / dt);
    ref = zeros(1, steps);
    for t = 1:steps
        time = t * dt;
        ref(t) = 1 / 5 * ((time <= 210) && (time >= 200));
    end
    
end