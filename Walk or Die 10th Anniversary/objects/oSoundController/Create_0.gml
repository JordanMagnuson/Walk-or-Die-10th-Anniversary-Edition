FADE_DURATION = 10;
inProcess = false;
newSound = oLocation.daySound; //set to base value

function soundController(location){
	currentSound = oLocation.daySound;
	audio_play_sound(currentSound, 100, true)
}

function changeLocation(location){
	show_debug_message("change location");
	if(inProcess == true){
		show_debug_message("in process");
		//show_debug_message("current sound vol: " + currentSound.volume);
		//show_debug_message("new sound vol: " + newSound.volume);
	}
	else{
		if(oMyWorldController.time == "day"){
			newSound = oLocation.daySound;	
		}
		else{
			newSound = oLocation.nightSound;
		}
		//fader line
		audio_stop_all();
		audio_play_sound(newSound, 100, true);
		currentSound = newSound;
		inProcess = true;
	}
}

function fadeComplete(){
	inProcess = false;
	
	if(oMyWorldController.time == "day" && currentSound != oLocation.daySound){
		show_debug_message("catching up with day");
		startDay();	
	}
	else if (oMyWorldController.time != "day" && currentSound != oLocation.nightSound){
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
		newSound = oLocation.nightSound;
		audio_stop_sound(currentSound);
		audio_play_sound(newSound, 100, true);
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
		newSound = oLocation.daySound;
		audio_stop_sound(currentSound);
		audio_play_sound(newSound, 100, true);
		currentSound = newSound;
		inProcess = true;
	}	
}