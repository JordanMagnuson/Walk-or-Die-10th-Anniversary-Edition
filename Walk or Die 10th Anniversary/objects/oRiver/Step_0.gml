event_inherited();
//thank you stackoverflow: https://stackoverflow.com/questions/929103/convert-a-number-range-to-another-range-maintaining-ratio

if(instance_exists(oPlayer)){
	pan = x+(room_width/2)-oPlayer.x;
	//show_debug_message("x: " + string(x) + " pan: " + string(pan) + " room_width/2: " + string(room_width/2));
	audio_emitter_position(sEmit5, pan, 0, 0);
}
if(x <= 52 && !fadeStarted){
	fadeStarted = true;
	
}
if(!fadeStarted){
	//NewValue = (((OldValue - OldMin) * (NewMax - NewMin)) / (OldMax - OldMin)) + NewMin
	vol = (((x - 40) * (0.1 - 0.7)) / (room_width - 40)) + 0.7;
	audio_emitter_gain(sEmit5, vol);
}
else{
	vol -= (1/5)/room_speed;	//fade the volume to 0 after 5 seconds
	audio_emitter_gain(sEmit5, vol);
}