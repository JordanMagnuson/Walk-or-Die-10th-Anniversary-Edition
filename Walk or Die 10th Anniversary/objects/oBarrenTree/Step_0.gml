if (random(1) < 0.002 && !audio_is_playing(sndCreaking)){
	pan = (((x-0)*(1-(-1)))/(room_width-0))+-1;
	vol = 0.2 + 0.8 * random(1);
	audio_emitter_gain(sEmit5, vol);
	audio_emitter_position(sEmit5, pan, 0, 0);
	audio_play_sound_on(sEmit5, sndCreaking, false, 20);
}