function [filteredData] = weighted_avg_filter(data,windowSize)

%returns a guassian window of "window size" points.
weighting = gausswin(windowSize);
%sums the weightings
weighting_sum = sum(weighting,1);

%averaging weightings
weighting = weighting./weighting_sum;

%returns the weighted average data
filteredData = filter(weighting,1,data);

end

