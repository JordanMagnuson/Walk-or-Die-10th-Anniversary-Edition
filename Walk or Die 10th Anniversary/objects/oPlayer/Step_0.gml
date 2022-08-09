if (global.orientation_check_visible) {
	return;
}
	
X = (keyboard_check(vk_space) || mouse_check_button(mb_any))

if(walking && !audio_is_playing(sndWalking)){
	audio_play_sound(sndWalking, 75, true);
}

if(X == true){
	walking = true;
	image_speed = animSpeed;
}
else if (!global.debug) {
	walking = false;
	image_index = 0;
	image_speed = 0;
}

if (keyboard_check_released(vk_space) || mouse_check_button_released(mb_any)) {
	stopped_walking = true;
}

if (stopped_walking && !global.debug){
	audio_stop_sound(sndWalking);
	playerDying = instance_create_depth(0, 0, 0, oPlayerDying);
	playerDying.x = x;
	playerDying.y = y; 
	instance_destroy();
}