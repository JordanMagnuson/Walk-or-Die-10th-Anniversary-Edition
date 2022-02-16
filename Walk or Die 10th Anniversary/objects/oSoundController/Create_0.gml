FADE_DURATION = 10;
inProcess = false;
newSound = asset_get_index(oLocation.daySound); //set to base value
soundEmitter = audio_emitter_create();
currentGain = 1;
function soundController(location){
	currentSound =  asset_get_index(oLocation.daySound);
	audio_play_sound_on(soundEmitter, currentSound, 1, 100);
}

function changeLocation(location){
	//show_debug_message("change location");
	if(inProcess == true){
		//show_debug_message("in process");
		//show_debug_message("current sound vol: " + currentSound.volume);
		//show_debug_message("new sound vol: " + newSound.volume);
	}
	else{
		if(oMyWorldController.time == "day"){
			newSound =  asset_get_index(oLocation.daySound);	
		}
		else{
			newSound = asset_get_index(oLocation.nightSound);
		}

		currentSound = newSound;
		inProcess = true;
	}
}

function fadeComplete(){
	inProcess = false;
	audio_emitter_free(soundEmitter);//stop the previous sound
	soundEmitter = audio_emitter_create(); //recreate the emitter
	audio_play_sound_on(soundEmitter, newSound, 1, 100); //play the new sound
	
	if(oMyWorldController.time == "day" && currentSound != asset_get_index(oLocation.daySound)){
		show_debug_message("catching up with day");
		startDay();	
	}
	else if (oMyWorldController.time != "day" && currentSound !=asset_get_index(oLocation.nightSound)){
		show_debug_message("catching up with night");
		startNight();
	}
	else{
		show_debug_message("no need to catch up");	
	}
}

function startNight(){
	show_debug_message("start night");
	if(inProcess == true){
		show_debug_message("in process");
		//show_debug_message("current sound vol: " + currentSound.volume);
		//show_debug_message("new sound vol: " + newSound.volume);
	}
	else{
		newSound =  asset_get_index(oLocation.nightSound);
		audio_play_sound_on(soundEmitter, newSound, true, 100);
		currentSound = newSound;
		inProcess = true;
	}	
}

function startDay(){
	show_debug_message("start day");
	if(inProcess == true){
		show_debug_message("in process");
		//show_debug_message("current sound vol: " + currentSound.volume);
		//show_debug_message("new sound vol: " + newSound.volume);
	}
	else{
		newSound =  asset_get_index(oLocation.daySound);
		currentSound = newSound;
		audio_play_sound_on(soundEmitter, newSound, true, 100); //HTML5 doesn't like passing sounds through variables
		inProcess = true;
	}	
}