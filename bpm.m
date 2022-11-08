function [calced_bpm] = bpm(resampled_data,file_name)

dataForPeakDetector = median_filter(weighted_avg_filter(abs(resampled_data),5000) , 2000);

sampleNum = 1:size(dataForPeakDetector) ;

plot(sampleNum,dataForPeakDetector);
xlabel('Sample Number');
ylabel('Waveform');
title('Drum Audio Filtered Waveform');

[numBeats, pks,locs] = peak_detector(dataForPeakDetector);

hold on;

text(locs+.02,pks,num2str((1:numel(pks))'));

audio_length = (size(resampled_data,1) / 16e3) / 60;

calced_bpm = numBeats / audio_length;

format short g;
fprintf("the BPM in the file "+file_name+" is %f\n",calced_bpm);

end
