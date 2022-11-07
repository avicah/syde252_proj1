function [numBeats] = bpm(resampled_data)

dataForPeakDetector = median_filter(weighted_avg_filter(abs(resampled_data),1000) , 200);

clf;
sampleNum = 1:size(dataForPeakDetector) ;

plot(sampleNum,dataForPeakDetector);
xlabel('Sample Number');
ylabel('Waveform');
title('filtered waveform');

[numBeats pks,locs] = peak_detector(dataForPeakDetector);

hold on;

text(locs+.02,pks,num2str((1:numel(pks))'));


end
