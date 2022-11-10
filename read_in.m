birds_audio_resampled = read_in_audio("Birds.wav");
drums_audio_resampled = read_in_audio("Drum.wav");
speech_audio_resampled = read_in_audio("Speech.wav");

% birds
movAvgFilteredBirds = mov_avg_filter(birds_audio_resampled,10);
%sound(movAvgFilteredBirds,16e3);

weightedAvgFilteredBirds = weighted_avg_filter(birds_audio_resampled,5000);
%sound(weightedAvgFilteredBirds,16e3);

medianFilteredBirds = median_filter(birds_audio_resampled,50000);
%sound(medianFilteredBirds,16e3);


% drums
movAvgFilteredDrums = mov_avg_filter(drums_audio_resampled,10);
%sound(movAvgFilteredDrums,16e3);

weightedAvgFilteredDrums = weighted_avg_filter(drums_audio_resampled,5000);
%sound(weightedAvgFilteredDrums,16e3);

medianFilteredDrums = median_filter(drums_audio_resampled,50000);
%sound(medianFilteredDrums,16e3);


% speech
movAvgFilteredSpeech = mov_avg_filter(speech_audio_resampled,10);
%sound(movAvgFilteredSpeech,16e3);

weightedAvgFilteredSpeech = weighted_avg_filter(speech_audio_resampled,5000);
%sound(weightedAvgFilteredSpeech,16e3);

medianFilteredSpeech = median_filter(speech_audio_resampled,50000);
%sound(medianFilteredSpeech,16e3);


clf;
hold on;

subplot(3,1,1);
bpm(drums_audio_resampled,"Drum.wav");
subplot(3,1,2);
syllable_count(speech_audio_resampled,"Speech.wav");
subplot(3,1,3);
birds_silence(birds_audio_resampled);
