function birds_silence(resampled_data)

dataForPeakDetector = median_filter(weighted_avg_filter(abs(resampled_data),1000), 2000);

clf;

size(dataForPeakDetector)
sampleNum = 1:size(dataForPeakDetector);
y = dataForPeakDetector;
plot(sampleNum,y)
xlabel('Sample Number');
ylabel('Waveform');

hold on;


threshold = 0.01;

under_x = [];
under_y = [];
for i=1:size(dataForPeakDetector, 1)
    if y(i,1)<threshold
        under_y(i,1) = 0.007;
    else
        under_y(i,1) = 0;
    end
end

plot(sampleNum, under_y)
title('Silent Regions');

end
