CHANGE_LOCATION_TIME = 4 * room_speed ;

oddFrame = 1;
thirdFrame = 1;
fourthFrame = 1;
forceClouds = false;
time = "";
randomise();

room_width = 300;
room_height = 200;

locationName = choose("desert", "forest", "snow", "plains", "beach");
locationName = "forest"; //TEMPORARY FOR RIVER NOISE, DELETE LATER
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
alarm[0] = CHANGE_LOCATION_TIME;//changeLocationAlarm

//UNCOMMENT THE BELOW ITEMS AS THEY ARE ADDED INTO THE GAME
//Sound Controller
instance_create_depth(0,0,0, oSoundController);
oSoundController.soundController(locationName);

//Ground and Sky
ground = instance_create_depth(0,175,12, oGround);
oGround.x = -sprite_get_width(sprGroundBeach)/2;

//need to find the correct layer or depth for osky
instance_create_depth(0, 0, 0, oSky);
oSky.Sky();
	
//Mountain controller
instance_create_depth(0,0,0, oMountainController);

//Night-Day cycle
instance_create_depth(0,0,0, oDay);
oDay.Day(self, false);

//Player
player = instance_create_depth(0, 0, -1, oPlayer);
//Starting Text
instance_create_depth(0,0,0, oTextPress);

// Camera
instance_create_depth(0,0, -1, oCamera);

//start of game changes  
oLocation.creationTime = 2;
oLocation.gameStart();
oLocation.alarm[0] = 6; // 6 frames = 0.1 seconds 

// Hide cursor.
window_set_cursor(cr_none);

// Debug?
if (global.debug) {
	instance_create_depth(0,0,0, oCheater);
}

function changeLocation(){
	if(instance_exists(oPlayer)){
		var newLocation;
		do{
			newLocation = choose("forest", "desert", "plains", "snow",  "beach");
		} 
		until (newLocation != locationName);
	
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

function changeLocationChance(){
	alarm[0] = CHANGE_LOCATION_TIME;
	if(instance_exists(oLocation)){
		switch (oLocation.creationTimeSlope){
			case 1:
				if (oLocation.creationTime < (oLocation.minCreationTime * 2)){
					if (random(1) > 0.6){
						oLocation.creationTimeSlope = 0;
					}
				}
				break;
			case 0:
				if (random(1) > 0.6){
					oLocation.creationTimeSlope = -1;
				}
				break;
			case -1:
				if (oLocation.creationTime > (oLocation.maxCreationTime * 0.75)){
					if (random(1) > 0.6){
						changeLocation();
					}		
				}
				break;
		}
	}
}

function advanceTime(){
	switch (time){
		case "day":
			instance_create_depth(0, 0, 999, oSunset)
			oSunset.Sunset();
			//oDay.complete();
			break;
		case "sunset":
			instance_create_depth(0, 0, 999, oNight)
			oNight.Night();
			//oSunset.complete();
			break;
		case "night":
			instance_create_depth(0, 0, 999 , oDay);
			oDay.Day(self);
			//oNight.complete();
			break;
	}
}

function showTitle(){
	instance_create_depth(0,0,0, oTextJordan);	
}