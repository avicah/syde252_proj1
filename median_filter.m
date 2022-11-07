function [filteredData] = median_filter(data,windowSize)

filteredData = movmedian(data, [windowSize-1,0]);

end

