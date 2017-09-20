function spikes = GenerateSpikes(rates)
    spikes = zeros(size(rates));
	for i = 1:length(rates)
        if rates(i) <= 0
            spikes(i) = 0;
        else
            spikes(i) = min(1, poissrnd(rates(i)));
        end
	end
end
