function [num_peaks,peaks,locs] = peak_detector(data)

[peaks,locs] = findpeaks(data);
num_peaks = size(peaks,1);

end

