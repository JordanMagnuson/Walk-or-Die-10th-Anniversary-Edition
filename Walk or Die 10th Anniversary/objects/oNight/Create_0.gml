/// @description Insert description here
// You can write your code in this editor

DURATION = 30;
FADE_IN_DURATION = 6;
FADE_OUT_DURATION = 10;
MAX_ALPHA = 0.7;

sprite_index = sprNightCover;

alpha = 0;
fadein = false;
fadeout = false;

alarm[0] = 2*room_speed;

function fadeIn(){
	fadein = true;	
	instance_create_depth(0,0,0, oStars);
}

fadeIn();

function fadeOut(){
	fadeout = true;
}

function complete(){
	instance_create_depth(0,0,0, oDay);
	fadeOut();
}

function destroy(){
	instance_destory(self);	
}


