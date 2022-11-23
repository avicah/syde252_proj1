%Reads in each resampled audio
birds_audio_resampled = read_in_audio("Birds.wav");
drums_audio_resampled = read_in_audio("Drum.wav");
speech_audio_resampled = read_in_audio("Speech.wav");

%BIRDS:
%moving average filter for birds.wav:
movAvgFilteredBirds = mov_avg_filter(birds_audio_resampled, 10);
sound(movAvgFilteredBirds,16e3);

%plot for sample number vs. filter
sampleNum = 1:size(movAvgFilteredBirds);
plot(sampleNum, movAvgFilteredBirds)

%weighted average filter for birds.wav:
weightedAvgFilteredBirds = weighted_avg_filter(birds_audio_resampled,9);
sound(weightedAvgFilteredBirds,16e3);

%median filter for birds.wav:
medianFilteredBirds = median_filter(birds_audio_resampled,5);
sound(medianFilteredBirds,16e3);

%DRUMS:
%moving average filter for drums.wav:
movAvgFilteredDrums = mov_avg_filter(drums_audio_resampled, 14);
sound(movAvgFilteredDrums,16e3);

%weighted average filter for drums.wav:
weightedAvgFilteredDrums = weighted_avg_filter(drums_audio_resampled,10);
sound(weightedAvgFilteredDrums,16e3);

%median filter for drums.wav:
medianFilteredDrums = median_filter(drums_audio_resampled,10);
sound(medianFilteredDrums,16e3);

%SPEECH:
%moving average filter for speech.wav:
movAvgFilteredSpeech = mov_avg_filter(speech_audio_resampled,10);
sound(movAvgFilteredSpeech,16e3);

%weighted average filter for speech.wav:
weightedAvgFilteredSpeech = weighted_avg_filter(speech_audio_resampled,5000);
sound(weightedAvgFilteredSpeech,16e3);

%median filter for speech.wav:
medianFilteredSpeech = median_filter(speech_audio_resampled,50000);
sound(medianFilteredSpeech,16e3);


%Plots the beats per minute, number of syllables and silent regions
clf;
hold on;

subplot(3,1,1);
bpm(drums_audio_resampled,"Drum.wav");
legend('BPM of Drum.wav')
subplot(3,1,2);
syllable_count(speech_audio_resampled,"Speech.wav");
legend('No. of syllables in Speech.wav')
subplot(3,1,3);
birds_silence(birds_audio_resampled,"Birds.wav");
legend('Silent regions in Birds.wav')