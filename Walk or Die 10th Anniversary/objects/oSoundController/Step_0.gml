if(inProcess){
	currentGain -= 1/(FADE_DURATION/2 * room_speed);
	audio_emitter_gain(soundEmitter, currentGain);
	if(currentGain <= 0.1){
		fadeComplete();	
	}	
}
else{
	if(currentGain <1){
		currentGain += 1/(FADE_DURATION/2 * room_speed)
		audio_emitter_gain(soundEmitter, currentGain);
	}
}