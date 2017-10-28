% % Is missing to use lambda 0.9 and lambda 0.99
[dv, v, delta, u_, trials] = learn(0.5);

% % This plots needs to be organized


% figure();
% plot(v);
% figure()
% plot(d(:,1));
% figure()
% plot(d(:,k));
% figure()
% plot(dv);

% Plot delta 3D
surf(5*(0:50),1:k,d');

function [dv, v, delta, u_, trials] = learn(lambda)

%     Update fix numbers 51 and 52

    v = zeros(1,52);
    dv = zeros(1,52);
    u_ = zeros(1,51);
    w = zeros(1,51);
    delta = zeros(51,1);
    epsilon = 0.2;
    trials = 0;
    while(trials<=1 || norm(delta(:,trials)-delta(:,trials-1))>1e-5)
        trials = trials+1;
        for t = 2:51
            u_(t) = lambda * u_(t-1) + (1-lambda) * u(t);
            v(t) = w(1:t) * u(t:-1:1)';
            dv(t) = v(t+1) - v(t);
            delta(t,trials)=  r(t) +  dv(t);
            w(1:t) =  w(1:t) + epsilon * d(t,trials) * u_(t:-1:1); 	
        end
    end
end


function stim = u(t)
    t = t * 5;
    stim = (t == 100);
end

function ref = r(t)
    t = t * 5;
    ref = 1 / 5 * ((t <= 210) && (t >= 200));
end