CHANGE_LOCATION_TIME = 4;

oddFrame = 1;
thirdFrame = 1;
fourthFrame = 1;
forceClouds = false;

room_width = 300;
room_height = 200;

//currentLocation = choose(oDesert, oForest, oSnow, oPlains, oBeach);//this is what is should be once those are created
currentLocation = oBeach;
instance_create_depth(0, 0, 0, currentLocation);
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
player = instance_create_depth(0, 0, 0, oPlayer);
player.x = 50;
player.y = 100; //should be Ground.y but ground is not made yet
//Starting Text
//instance_create_depth(0,0,0, otextPress);

//start of game changes
currentLocation.gameStart();
currentLocation.creationTime = 2;
currentLocation.alarm[0] = 0.1;

randomise();
cloud = instance_create_depth(0, 0, 0, oCloud);
cloud.x = 350;
cloud.y = oCloud.MIN_HEIGHT + random(1) * (oCloud.MAX_HEIGHT - oCloud.MIN_HEIGHT); //need to correct MIN and MAX height
//show_debug_message(cloud.y);



function changeLocation(){
	var newLocation;
	do{
		//newLocation = choose(oForest, oDesert, oPlains, oSnow, oBeach);
		newLocation = oBeach;//TEMP
	} 
	until (newLocation != currentLocation);
	//oSoundController.changeLocation(newLocation);
	instance_destroy(currentLocation);
	currentLocation = newLocation;
	instance_create_depth(0, 0, 0, currentLocation);
	//oldGround = oGround;
	//instance_create_depth(0, 0, 0, oGround(currentLocation);		
}