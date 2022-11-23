function [num_peaks,peaks,locs] = peak_detector(data)

%returns a vector with the local maxima in our data signal
[peaks,locs] = findpeaks(data);

%extracts the number of peaks from this vector
num_peaks = size(peaks,1);

end

