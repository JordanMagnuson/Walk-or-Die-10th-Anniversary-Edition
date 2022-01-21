CHANGE_LOCATION_TIME = 4;

oddFrame = 1;
thirdFrame = 1;
fourthFrame = 1;
forceClouds = false;
/*
//THIS IS NOT THE FINAL LOCATION FOR THIS SECTION OF CODE, DELETE LATER
randomise();
cloud = instance_create_depth(350, 0, 0, oCloud);
cloud.y = oCloud.MIN_HEIGHT + random(1) * (oCloud.MAX_HEIGHT - oCloud.MIN_HEIGHT); //need to correct MIN and MAX height
//show_debug_message(cloud.y);
*/

room_width = 300;
room_height = 200;

//locationName = choose("desert", "forest", "snow", "plains", "beach");
locationName = "beach";
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

//instance_create_depth(0, 0, 0, oSky);
	
//Mountain controller
//instance_create_depth(0,0,0, oMountainController);

//Night-Day cycle
//instance_create_depth(0,0,0, oDay(this, false);

//Player
player = instance_create_depth(0, 0, -1, oPlayer);
//Starting Text
//instance_create_depth(0,0,0, otextPress);

//start of game changes
if(locationName = "beach"){
	oBeach.creationTime = 2;
	oBeach.alarm[0] = 0.1;
	oBeach.gameStart();
} else if(locationName = "desert"){
	oDesert.creationTime = 2;
	oDesert.alarm[0] = 0.1;
	oDesert.gameStart();
} else if(locationName = "snow"){
	oSnow.creationTime = 2;
	oSnow.alarm[0] = 0.1;
	oSnow.gameStart();
} else if(locationName = "forest"){
	oForest.creationTime = 2;
	oForest.alarm[0] = 0.1;
	oForest.gameStart();
} else if(locationName = "plains"){
	oPlains.creationTime = 2;
	oPlains.alarm[0] = 0.1;
	oPlains.gameStart();
}

function changeLocation(){
	var newLocation;
	do{
		newLocation = choose(/*"forest", */"desert", /*"plains",*//* "snow", */"beach");
	} 
	until (newLocation != locationName);
	//oSoundController.changeLocation(newLocation);
	instance_destroy(currentLocation);
	locationName = newLocation;
	currentLocation = instance_create_depth(0, 0, 0, currentLocation);
	oldGround = ground;
	instance_create_depth(0, 0, 0, oGround);	
	oGround.Ground(currentLocation);
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
	//instance_create_depth(0,0,0, otextJordan);	
}