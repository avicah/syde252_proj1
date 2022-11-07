function [filteredData] = weighted_avg_filter(data,windowSize)

weighting = gausswin(windowSize);
weighting_sum = sum(weighting,1);

weighting = weighting./weighting_sum;

filteredData = filter(weighting,1,data);

end

