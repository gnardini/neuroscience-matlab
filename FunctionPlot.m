function FunctionPlot( expected, variance, t, xLeyend, yLeyend )
    p = polyfit(expected, variance, 1)
    y1 = polyval(p, expected);

    plot(expected, variance, 'o');
    hold on 
    plot(expected, y1)
    title(t,'fontsize', 14);
	xlabel(xLeyend,'fontsize', 12);
	ylabel(yLeyend,'fontsize', 12);
    hold off
end

