CHANGE_LOCATION_TIME = 4;

oddFrame = 1;
thirdFrame = 1;
fourthFrame = 1;
forceClouds = false;

//THIS IS NOT THE FINAL LOCATION FOR THIS SECTION OF CODE, DELETE LATER
randomise();
cloud = instance_create_depth(350, 0, 0, oCloud);
cloud.y = oCloud.MIN_HEIGHT + random(1) * (oCloud.MAX_HEIGHT - oCloud.MIN_HEIGHT); //need to correct MIN and MAX height
//show_debug_message(cloud.y);

//function myWorld(){ //temporarily comment this out so the game runs
	room_width = 300;
	room_height = 200;

	//currentLocation = choose(oDesert, oForest, oSnow, oPlains, oBeach);//this is what is should be once those are created
	currentLocation = instance_create_depth(0, 0, 0, oBeach);

	alarm[0] = CHANGE_LOCATION_TIME;//changeLocationAlarm

	//UNCOMMENT THE BELOW ITEMS AS THEY ARE ADDED INTO THE GAME
	//Sound Controller
	//instance_create_depth(0,0,0, oSoundController(currentLocation); 

	//Ground and Sky
	/*
	instance_create_depth(0,0,0, oGround(currentLocation));
	oGround.x = -oGround.image_width/2;
	instance_create_depth(0, 0, 0, oSky);
	*/
	//Mountain controller
	//instance_create_depth(0,0,0, oMountainController);

	//Night-Day cycle
	//instance_create_depth(0,0,0, oDay(this, false);

	//Player
	player = instance_create_depth(0, 0, -1, oPlayer);

	//Starting Text
	//instance_create_depth(0,0,0, otextPress);

	//start of game changes
	//currentLocation.gameStart();
	currentLocation.creationTime = 2;
	currentLocation.alarm[0] = 0.1;
//}

function changeLocation(){
	var newLocation;
	do{
		//newLocation = choose(oForest, oDesert, oPlains, oSnow, oBeach);
		newLocation = instance_create_depth(0, 0, 0, oBeach);//TEMP
	} 
	until (newLocation != currentLocation);
	//oSoundController.changeLocation(newLocation);
	instance_destroy(currentLocation);
	currentLocation = newLocation;
	instance_create_depth(0, 0, 0, currentLocation);
	//oldGround = oGround;
	//instance_create_depth(0, 0, 0, oGround(currentLocation));		
}

function changeLocationChance(){
	alarm[0] = CHANGE_LOCATION_TIME;
	if(instance_exists(oLocation)){
		switch (currentLocation.creationTimeSlope){
			case 1:
				if (currentLocation.creationTime < (currentLocation.minCreationTime * 2)){
					if (random(1) > 0.6){
						currentLocation.creationTimeSlope = 0;
					}
				}
				break;
			case 0:
				if (random(1) > 0.6){
					currentLocation.creationTimeSlope = -1;
				}
				break;
			case -1:
				if (currentLocation.creationTime > (currentLocation.maxCreationTime * 0.75)){
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