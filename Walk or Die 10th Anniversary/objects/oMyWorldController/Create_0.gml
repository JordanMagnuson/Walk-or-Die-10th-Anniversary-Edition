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
	//trace('Changing location');
	var newLocation;
	do{
		newLocation = FP.choose(new Forest, new Desert, new Plains, new Snow, new Beach);
		//newLocation = FP.choose(new Forest, new Beach);
	} 
	while (newLocation.type == this.location.type);
	soundController.changeLocation(newLocation);
	remove(location);
	add(location = newLocation);
	oldGround = ground;
	add(ground = new Ground(location));			
	//trace('new location: ' + location);
}