function [numSyllables] = syllable_count(resampled_data,file_name)

%applies a series of filtered to re-sampled data to smooth waveform
dataForPeakDetector = median_filter(weighted_avg_filter(abs(resampled_data),2000) , 500);

sampleNum = 1:size(dataForPeakDetector) ;

%plots the filtered data to visualize the waveform
plot(sampleNum,dataForPeakDetector, 'r');
xlabel('Sample Number');
ylabel('Waveform');
title('Speech Audio Filtered Waveform');

%performs basic peak analysis on filtered data
[numSyllables, pks,locs] = peak_detector(dataForPeakDetector);

hold on;

text(locs+.02,pks,num2str((1:numel(pks))'));

fprintf("the number of syllables in the file "+file_name+" is %d\n",numSyllables);

end

