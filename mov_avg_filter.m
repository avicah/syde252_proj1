function [filteredData] = mov_avg_filter(data,windowSize)

%computes the numerator and denominator coefficients for the rational
%transfer function (Equation 1)
weighting = (1/windowSize) * ones(windowSize,1);

%finds the moving average of the data
filteredData = filter(weighting,1,data);

end

