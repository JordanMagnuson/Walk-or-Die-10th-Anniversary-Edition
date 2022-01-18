SND_GULLS01 = sndGulls01;
SND_GULLS02 = sndGulls02;
SND_GULLS03 = sndGulls03;

sndGullsRandom = choose(SND_GULLS01, SND_GULLS02, SND_GULLS03);

function added(){
	instance_create_depth(0, 0, 0, oWaves);
}

//Controls item creation for this location
function createItem(){
	creationNumber = random_range(0,1);
	if (random_range(0,1) > 0.25){		
		if (creationNumber < 0.005 && oCastle.seen == false){
			instance_create_depth(0, 0, 0, oCastle);
			oCastle.seen = true;
		}
		else if (creationNumber < 0.05){
			instance_create_depth(0, 0, 0, oCactus);
		}
		else if (creationNumber < 0.4){
			instance_create_depth(0, 0, 0, oBeachGrass);
		}
		else if (creationNumber < 1){
			instance_create_depth(0, 0, 0, oSandDune);
		}
	}		
	
	//sounds
	if (random_range(0,1) > 0.4){
		pan = choose( -1, 1) * random_range(0,1);
		vol = 0.3 + 0.7 * random_range(0,1);
		// Night sounds
		if (oMyWorldController.time == "night"){
			if (creationNumber < 0.05 && !audio_is_playing(sndGullsRandom)){
				sndGullsRandom = choose(sndGulls01, sndGulls02, sndGulls03);
				//sndGullsRandom.play(vol, pan); Translated below, hopefully works
				sEmit0 = audio_emitter_create();
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit0, pan,0,0);
				audio_play_sound_on(sEmit0, sndGullsRandom, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends		
			}					
			else if (creationNumber < 0.15 && !audio_is_playing(sndWind)){
				//sndWind.play(vol, pan);
				sEmit1 = audio_emitter_create();
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit1, pan,0,0);
				audio_play_sound_on(sEmit1, sndWind, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}		
		}
		// Day sounds
		else{
			if (creationNumber < 0.1 && !audio_is_playing(sndWind)){
				sEmit2 = audio_emitter_create();
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit2, pan,0,0);
				audio_play_sound_on(sEmit2, sndWind, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}						
			else if (creationNumber < 0.6 && !audio_is_playing(sndGullsRandom)){
				sndGullsRandom = choose(sndGulls01, sndGulls02, sndGulls03);
				sEmit3 = audio_emitter_create();
				audio_emitter_gain(sEmit0, vol);
				audio_emitter_position(sEmit3, pan,0,0);
				audio_play_sound_on(sEmit3, sndGullsRandom, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
			}					
		}
	}	
}

function removed(){
	oWaves.fadeOut();
}

function gameStart(){
	oLocation.gameStartItem(rmMyWorld, oSandDune);	
}