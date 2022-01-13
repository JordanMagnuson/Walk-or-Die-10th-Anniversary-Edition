//TEMPORARY TIME
time = "DAY";
/**
* How often to consider changing locations, also determined by
* how long we've been in a location.
*/
CHANGE_LOCATION_TIME = 4;
/**
* Used to move objects slower than one pixel per frame
*/
oddFrame = 1;	//this was static
thirdFrame = 1;	//this was static
fourthFrame = 1;	//this was static
forceClouds = false;	//this was static

room_width = 300;
room_height = 200;

//set location
location = choose("Desert", "Forest", "Snow", "Plains", "Beach");
player = instance_create_depth(0, 0, 0, oPlayer);

player.x = 50;
player.y = 100; //should be Ground.y but ground is not made yet
