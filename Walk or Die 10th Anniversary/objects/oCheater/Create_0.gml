show_debug_message("debug mode is on. oCheater is loaded.")

function changeLocationCheat(newLocation){
	if(instance_exists(oPlayer)){
		//as the location changes, free up the emitters to prevent a memory leak; Currently in Progress
		audio_emitter_free(oLocation.sEmit0);
		audio_emitter_free(oLocation.sEmit1);
		audio_emitter_free(oLocation.sEmit2);
		audio_emitter_free(oLocation.sEmit3);
	
		instance_destroy(currentLocation);
		locationName = newLocation;
		if(locationName == "desert"){
		currentLocation = instance_create_depth(0, 0, 0, oDesert); //at this point currentLocation is just an id number
		}
		else if(locationName == "beach"){
			currentLocation = instance_create_depth(0, 0, 0, oBeach);
		}
		else if(locationName == "forest"){
			currentLocation = instance_create_depth(0, 0, 0, oForest);
		}
		else if(locationName == "snow"){
			currentLocation = instance_create_depth(0, 0, 0, oSnow);
		}
		else if(locationName == "plains"){
			currentLocation = instance_create_depth(0, 0, 0, oPlains);
		}
		show_debug_message("Current location: " + locationName);   
		oLocation.Location();    
		oLocation.creationTime = 2;
		oLocation.alarm[0] = 6; // 6 frames = 0.1 seconds
		
		oSoundController.changeLocation(newLocation);
		
		//destroys old ground when change location is spammed
		if(variable_instance_exists(oMyWorldController, "oldGround")){ 
			if(instance_exists(oldGround)){
				instance_destroy(oldGround);
			}
		}
		oldGround = ground;
		ground = instance_create_depth(room_width, oGround.y, 12, oGround);	
	}
}