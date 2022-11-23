function [filteredData] = median_filter(data,windowSize)

%computes the median with a window of length windowSize
filteredData = movmedian(data, [windowSize-1,0]);

end

