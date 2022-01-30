event_inherited();
SND_GULLS01 = sndGulls01;
SND_GULLS02 = sndGulls02;
SND_GULLS03 = sndGulls03;
creationTimeSlope = 1;
sndGullsRandom = choose(SND_GULLS01, SND_GULLS02, SND_GULLS03);

DAY_SOUND = sndWavesAmbient;
NIGHT_SOUND = sndWavesAmbient;
Location(DAY_SOUND,NIGHT_SOUND);

locationType = "beach";
instance_create_depth(0,0,0,oWaves);
oWaves.fadeIn();
sEmit0 = audio_emitter_create();
sEmit1 = audio_emitter_create();
sEmit2 = audio_emitter_create();
sEmit3 = audio_emitter_create();
oCastleSeen = false;

//Controls item creation for this location
function createItemHere(){
	oLocation.createItem();
	
	creationNumber = random_range(0,1);
	if (random_range(0,1) > 0.25){		
		if (creationNumber < 0.005 && oCastleSeen == false){ 
			instance_create_depth(room_width+10, 175, 0, oCastle);
			oCastleSeen = true;
			//show_debug_message(string(creationNumber) + ": Castle Created");
		}
		
		else if (creationNumber < 0.05){
			instance_create_depth(room_width+10, 175, 0, oCactus);
			//show_debug_message(string(creationNumber) + ": Cactus Created");
		}
	
		else if (creationNumber < 0.4){
			instance_create_depth(room_width+10, 175, 0, oBeachGrass);
			//show_debug_message(string(creationNumber) + ": BeachGrass Created");
		}

		else if (creationNumber < 1){
			instance_create_depth(room_width+10, 175, 0, oSandDune);
			//show_debug_message(string(creationNumber) + ": Sand Dune Created");
		}
	
	}
	//show_debug_message("Creation Number (oBeach CreateItemHere): " + string(creationNumber));  

	//sounds
	if (random_range(0,1) > 0.4){
		pan = choose( -1, 1) * random_range(0,1);
		vol = 0.3 + 0.7 * random_range(0,1);
		// Night sounds
		if (oMyWorldController.time == "night"){
			if (creationNumber < 0.05 && !audio_is_playing(sndGullsRandom)){
				sndGullsRandom = choose(sndGulls01, sndGulls02, sndGulls03);
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit0, pan,0,0);
				audio_play_sound_on(sEmit0, sndGullsRandom, false, 20);
			}					
			else if (creationNumber < 0.15 && !audio_is_playing(sndWind)){
				audio_emitter_gain(sEmit1, vol);
				audio_emitter_position(sEmit1, pan,0,0);
				audio_play_sound_on(sEmit1, sndWind, false, 20);
			}		
		}
		// Day sounds
		else{
			if (creationNumber < 0.1 && !audio_is_playing(sndWind)){
				audio_emitter_gain(sEmit2, vol);
				audio_emitter_position(sEmit2, pan,0,0);
				audio_play_sound_on(sEmit2, sndWind, false, 20);
			}			
			else if (creationNumber < 0.6 && !audio_is_playing(sndGullsRandom)){
				sndGullsRandom = choose(sndGulls01, sndGulls02, sndGulls03);
				audio_emitter_gain(sEmit3, vol);
				audio_emitter_position(sEmit3, pan,0,0);
				audio_play_sound_on(sEmit3, sndGullsRandom, false, 20);
			}					
		}
	}	  
}

function removed(){
	oWaves.fadeOut();
}

function gameStart(){
	instance_create_depth(150, 175, 0, oSandDune); 
}