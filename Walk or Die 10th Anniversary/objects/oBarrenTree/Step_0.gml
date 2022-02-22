if( random_range(0,1) < 0.002 &&  !audio_is_playing(sndCreaking)){
	pan = x+oPlayer.x;
	vol = 0.2 + 0.8 * random_range(0,1);
	
	audio_emitter_position(barrenTreeEmitter, pan, 0, 0);
	audio_emitter_gain(barrenTreeEmitter, vol);
	audio_play_sound_on(barrenTreeEmitter, sndCreaking, 0, 100);
	counter = 0;
}

if(counter < (4.08*room_speed)){ //stops this object from being destroyed before the sound is done
	counter++;	
}
//oItem step event copied, pasted, and editted so this object wouldn't be destroyed
//before the sound finished
if(image_xscale == -1){
	if(x < (0 + sprite_width) and counter >= (4.08*room_speed)){
	//show_debug_message("object destroyed, went offscreen, x = " + string(x));
	offScreenAction();
	}
}
else if(x < (0 - sprite_width)and counter >= (4.08*room_speed)){
	//show_debug_message("object destroyed, went offscreen, x = " + string(x));
	offScreenAction();
}
				
if(instance_exists(oPlayer) && oPlayer.walking){
	switch(distance){
		case "mid": 
			//move mid distance objects exactly 1 pixel every other frame.
			if(oMyWorldController.oddFrame ==1){
				x -= oPlayer.SPEED/ 100;
			}
			break;
		case "close":
			//move close distance objects exatly 1 pixel every frame.
			x -= oPlayer.SPEED/100;
			break; 
		case "far":
			//move far distance objects exactly 1 pixel every third frame
			if(oMyWorldController.thirdFrame == 1){
				x -= oPlayer.SPEED/100;
			}
			break;
	}
}