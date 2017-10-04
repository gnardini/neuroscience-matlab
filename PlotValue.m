function PlotValue(value, t, xLeyend, yLeyend)
    hold on 
    plot(value, 'Color', StandarColor())
    title(t,'fontsize', 14);
	xlabel(xLeyend,'fontsize', 12);
	ylabel(yLeyend,'fontsize', 12);
    hold off
end
