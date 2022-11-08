function [numBeats] = birds_silence(resampled_data)

filtered_data = median_filter(weighted_avg_filter(abs(resampled_data),1000) , 200);

clf;
sampleNum = 1:size(filtered_data) ;

threshold_checked = sign(filtered_data - 0.01.*ones(size(filtered_data,1),1) );

silent_regions = (threshold_checked <= 0).*0.01;

hold on;

plot(sampleNum,filtered_data);
xlabel('Sample Number');
ylabel('Waveform');
title('filtered waveform');



plot(sampleNum,silent_regions);
%plot(over_x,0);


end
