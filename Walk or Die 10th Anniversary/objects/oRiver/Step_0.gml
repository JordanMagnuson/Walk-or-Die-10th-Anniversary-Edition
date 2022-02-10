event_inherited();
//thank you stackoverflow: https://stackoverflow.com/questions/929103/convert-a-number-range-to-another-range-maintaining-ratio
pan = (((x-0)*(1-(-1)))/(room_width-0))+-1; //NewValue = (((OldValue - OldMin) * (NewMax - NewMin)) / (OldMax - OldMin)) + NewMin

if(x <= 52 && !fadeStarted){
	fadeStarted = true;
	
}
if(!fadeStarted){
	vol = (((x - 40) * (0.1 - 0.7)) / (room_width - 40)) + 0.7
	audio_emitter_gain(sEmit5, vol);
}
else{
	vol -= (1/5)/room_speed;	//fade the volume to 0 after 5 seconds
	audio_emitter_gain(sEmit5, vol);
}