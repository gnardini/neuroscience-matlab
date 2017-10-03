function rk = Correlation(x_vect, y_vect, k, x_exp, y_exp)
    % probablemente las sumztorias fallen si los vectores tienen longitudes
    % distintas. Falta validar
    steps = size(x_vect);
    steps = steps(2);
    rk_vect = zeros(3);
%     for i = (defasaje+1):steps
%         rk = rk + (noise(i-defasaje)-exp) * (noise(i)-exp);
%     end
    for i = 1 : steps
        if i <= steps - k    
            rk_vect(1) = rk_vect(1) + (x_vect(i) - x_exp) * (y_exp(i+k));
            rk_vect(2) = rk_vect(2) + (x_vect(i) - x_exp)^2;
        end
        if i + k <= steps
            rk_vect(3) = rk_vect(3) + (y_vect(i + k) - y_exp)^2;
        end
    end
    rk_vect
    rk = rk_vect(1) / sqrt(rk_vect(2) * rk_vect(3));
end