function [numBeats] = birds_silence(resampled_data)

dataForPeakDetector = median_filter(weighted_avg_filter(abs(resampled_data),1000) , 200);

clf;
sampleNum = 1:size(dataForPeakDetector) ;



plot(sampleNum,dataForPeakDetector);
xlabel('Sample Number');
ylabel('Waveform');
title('filtered waveform');

[numBeats pks,locs] = peak_detector(dataForPeakDetector);

hold on;

x = 1:size(dataForPeakDetector);

output_silence = signs(dataForPeakDetector);

%under_data = dataForPeakDetector(underThreshold);

plot(x,output_silence);
%plot(over_x,0);


end
