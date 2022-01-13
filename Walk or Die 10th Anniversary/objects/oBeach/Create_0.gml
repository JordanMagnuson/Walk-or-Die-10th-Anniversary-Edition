DAY_SOUND = sndWavesAmbient;
NIGHT_SOUND = sndWavesAmbient;
SND_WIND = sndWind;
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
	if (random_range(0,1) > 0.4)
			{
				pan = choose( -1, 1) * random_range(0,1);
				vol = 0.3 + 0.7 * random_range(0,1);
				// Night sounds
				if (oMyWorldController.time == "night")
				{
					if (creationNumber < 0.05 && !audio_is_playing(sndGullsRandom))
					{
						sndGullsRandom = choose(sndGulls01, sndGulls02, sndGulls03);
						//sndGullsRandom.play(vol, pan); Translated below, hopefully works
						sEmit = audio_emitter_create();
						audio_emitter_position(sEmit, pan,0,0);
						audio_play_sound_on(sEmit, sndGullsRandom, false, 20);//need to add audio_emitter_free(sEmit) once the sound ends
						
					}					
					else if (creationNumber < 0.15 && !sndWind.playing)
					{
						sndWind.play(vol, pan);
					}		
				}
				// Day sounds
				else
				{
					if (creationNumber < 0.1 && !sndWind.playing)
					{
						sndWind.play(vol, pan);
					}						
					else if (creationNumber < 0.6 && !sndGullsRandom.playing)
					{
						sndGullsRandom = FP.choose(sndGulls01, sndGulls02, sndGulls03);
						sndGullsRandom.play(vol, pan);
					}					
				}
			}	
}