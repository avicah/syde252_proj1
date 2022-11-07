function [resampledData] = read_in_audio(filename)

[data,samplingrate] = audioread(filename);

if (size(data,2) == 2)
    monoData = [ sum(data(:,[1 2]),2)   ] ;
    
else
    monoData = data;
end

monoData;
%sound(monoData,samplingrate);

audiowrite(("mono"+filename),monoData,samplingrate);

sampleNum = 1:size(monoData) ;

plot(sampleNum,monoData);
xlabel('Sample Number')
ylabel('Waveform')
title('Waveform as a Function of Sample Number for '+filename)

[P,Q] = rat(16e3 / samplingrate);
abs(P/Q*samplingrate);
resampledData = resample(monoData,P,Q);

end

