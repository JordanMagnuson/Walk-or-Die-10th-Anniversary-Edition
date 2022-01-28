event_inherited();
sEmit0 = audio_emitter_create();
sEmit1 = audio_emitter_create();
sEmit2 = audio_emitter_create();
sEmit3 = audio_emitter_create();

oGiantPineSeen = false;
creationNumber = 0;

DAY_SOUND = sndForestAmbient;
NIGHT_SOUND = sndForestNightAmbient;

oLocation.Location(DAY_SOUND, NIGHT_SOUND);
locationType = "forest";

function createItemHere(){
	oLocation.createItem();
	
	creationNumber = random(1);
	
	//Mid distance
	if(random(1) > 0.2){
		if(creationNumber < 0.005 && oGiantPineSeen == false){
			instance_create_depth(room_width+10, 175,0, oGiantPine);
			show_debug_message("Giant Pine Created");
			oGiantPineSeen = true;
	 	}
		else if(creationNumber < 0.01){
			instance_create_depth(room_width+10, 175,0, oRiver);
			show_debug_message("River Created");
		}
		else if(creationNumber < 0.05){
			instance_create_depth(room_width+10, 175,0, oPineTreeSideways);
			show_debug_message("Pine Tree Sideways Created");
		}
		else if(creationNumber < 1){
			instance_create_depth(room_width+10, 175,0, oPineTree);	
			show_debug_message("Pine Tree Created");
		}
		//show_debug_message("Creation Number (oDesert CreateItemHere): " + string(creationNumber));  
	}
	//sounds
	if (random_range(0,1) > 0.4){
		pan = choose( -1, 1) * random_range(0,1);
		vol = 0.2 + 0.7 * random_range(0,1);
		// Night sounds
		if (oMyWorldController.time == "night"){
			if (creationNumber < 0.1 && !audio_is_playing(sndOwl)){
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit0, pan,0,0);
				audio_play_sound_on(sEmit0, sndOwl, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends		
			}					
			else if (creationNumber < 0.2 && !audio_is_playing(sndWolf)){
				//sndWind.play(vol, pan);
				audio_emitter_gain(sEmit1, vol);
				audio_emitter_position(sEmit1, pan,0,0);
				audio_play_sound_on(sEmit1, sndWolf, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}	
			else if (creationNumber < 0.3 && !audio_is_playing(sndCreaking)){
				//sndWind.play(vol, pan);
				audio_emitter_gain(sEmit2, vol);
				audio_emitter_position(sEmit2, pan,0,0);
				audio_play_sound_on(sEmit2, sndCreaking, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}
			else if (creationNumber < 0.4 && !audio_is_playing(sndCicadas)){
				//sndWind.play(vol, pan);
				audio_emitter_gain(sEmit3, vol);
				audio_emitter_position(sEmit3, pan,0,0);
				audio_play_sound_on(sEmit3, sndCicadas, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}
		}
		// Day sounds
		else{
			if (creationNumber < 0.01 && !audio_is_playing(sndCicadas)){
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit0, pan,0,0);
				audio_play_sound_on(sEmit0, sndCicadas, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}						
			else if (creationNumber < 0.02 && !audio_is_playing(sndOwl)){
				audio_emitter_gain(sEmit1, vol);
				audio_emitter_position(sEmit1, pan,0,0);
				audio_play_sound_on(sEmit1, sndOwl, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}
			else if (creationNumber < 0.03 && !audio_is_playing(sndWolf)){
				audio_emitter_gain(sEmit2, vol);
				audio_emitter_position(sEmit2, pan,0,0);
				audio_play_sound_on(sEmit2, sndWolf, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}
			else if (creationNumber < 0.15 && !audio_is_playing(sndCreaking)){
				audio_emitter_gain(sEmit3, vol);
				audio_emitter_position(sEmit3, pan,0,0);
				audio_play_sound_on(sEmit3, sndCreaking, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}
		}
	}
}

function gameStart(){
	instance_create_depth(150, 175, 0, oPineTree);	
}