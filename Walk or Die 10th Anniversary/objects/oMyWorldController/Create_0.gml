CHANGE_LOCATION_TIME = 4 * room_speed ;

oddFrame = 1;
thirdFrame = 1;
fourthFrame = 1;
forceClouds = false;
time = "day"; //TEMP TIME FOR TESTING

randomise();

room_width = 300;
room_height = 200;

locationName = choose("desert", "forest", "snow", "plains", "beach");

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
//instance_create_depth(0,0,0, oSoundController(currentLocation); 

//Ground and Sky
ground = instance_create_depth(0,0,0, oGround);
oGround.Ground(locationName);
oGround.x = -oGround.sprite_width/2;

//need to find the correct layer or depth for osky
instance_create_depth(0, 0, 0, oSky);
oSky.Sky();
	
//Mountain controller
instance_create_depth(0,0,0, oMountainController);

//Night-Day cycle
//instance_create_depth(0,0,0, oDay(this, false);

//Player
player = instance_create_depth(0, 0, -1, oPlayer);
//Starting Text
instance_create_depth(0,0,0, oTextPress);

//start of game changes
oLocation.Location();    
oLocation.creationTime = 2;
oLocation.gameStart();
oLocation.alarm[0] = 6; // 6 frames = 0.1 seconds 

function changeLocation(){
	var newLocation;
	do{
		newLocation = choose("forest", "desert", "plains", "snow",  "beach");
	} 
	until (newLocation != locationName);
	//oSoundController.changeLocation(newLocation);
	
	//as the location changes, free up the emitters to prevent a memory leak; Currently in Progress
	audio_emitter_free(oLocation.sEmit0);
	audio_emitter_free(oLocation.sEmit1);
	audio_emitter_free(oLocation.sEmit2);
	audio_emitter_free(oLocation.sEmit3);
	
	if(locationName == "beach")
		oBeach.removed();
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
	
	oldGround = ground;
	ground = instance_create_depth(0, 0, 0, oGround);	
	oGround.Ground(locationName);
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
	/* UNCOMMENT WHEN SUNSET, NIGHT, AND DAY ARE CREATED
	switch (time){
		case "day":
			instance_create_depth(0, 0, 1, oSunset)
			break;
		case "sunset":
			instance_create_depth(0, 0, 1, oNight)
			break;
		case "night":
			instance_create_depth(0, 0, 1, oDay(this)
			break;
			}
			*/
}

function showTitle(){
	instance_create_depth(0,0,0, oTextJordan);	
}