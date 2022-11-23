function [numBeats] = birds_silence(resampled_data,file_name)

%applies a series of filtered to re-sampled data to smooth waveform
filtered_data = median_filter(weighted_avg_filter(abs(resampled_data),1000) , 200);

sampleNum = 1:size(filtered_data) ;

%the threshold to determine a silent region is 0.01
%subtracting 0.01 from the data makes all values which fall in a silent region negative
threshold_checked = sign(filtered_data - 0.01.*ones(size(filtered_data,1),1) );

%if the sign was negative or 0 it falls in the silent region
silent_regions = (threshold_checked <= 0).*0.01;

hold on;

%plots the filtered data to visualize the waveform
plot(sampleNum,filtered_data, 'b');
xlabel('Sample Number');
ylabel('Waveform');
title('Birds Audio Filtered Waveform');

%marks the silent regions on the plot
plot(sampleNum,silent_regions);

end
