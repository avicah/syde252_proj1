resampled_data = read_in_audio("Birds.wav");

movAvgFilteredData = mov_avg_filter(resampled_data,10);

sound(movAvgFilteredData,16e3);

weightedAvgFilteredData = weighted_avg_filter(resampled_data,5000);

%sound(weightedAvgFilteredData,16e3);

medianFilteredData = median_filter(resampled_data,50000);

%sound(medianFilteredData,16e3);

clf;



birds_silence(resampled_data)