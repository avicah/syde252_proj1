function [filteredData] = mov_avg_filter(data,windowSize)

weighting = (1/windowSize) * ones(windowSize,1);
filteredData = filter(weighting,1,data);

end

