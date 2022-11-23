function [resampledData] = read_in_audio(filename)

%read in filter data and sampling rate of audio file
[data,samplingrate] = audioread(filename);

%checks whether input sound is mono or stereo, and changes it accordingly
if (size(data,2) == 2)
    monoData = [ sum(data(:,[1 2]),2)   ] ;
    
else
    monoData = data;
end

%plays sound
monoData;
sound(monoData,samplingrate);

%writes new sound to a new audio file
audiowrite(("mono"+filename),monoData,samplingrate);


%plots the sample number vs. filter data
sampleNum = 1:size(monoData);
plot(sampleNum,monoData);
xlabel('Sample Number')
ylabel('Waveform')
title('Waveform as a Function of Sample Number for '+filename)

%downsamples or upsamples to 16KHz
[P,Q] = rat(16e3 / samplingrate);
abs(P/Q*samplingrate);
resampledData = resample(monoData,P,Q);

end

