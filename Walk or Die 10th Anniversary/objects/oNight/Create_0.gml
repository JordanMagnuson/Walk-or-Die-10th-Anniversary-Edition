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

function fadeIn(){
	fadein = true;	
	instance_create_depth(0,0,0, oStars);
}

fadeIn();

function destroy(){
	instance_destory(self);	
}


