DURATION = 30;
FADE_IN_DURATION = 6;
FADE_OUT_DURATION = 10;
MAX_ALPHA = 0.7;

sprite_index = sprNightCover;

function Night(){
	oMyWorldController.time = "night";
	depth = -999
	//blending is happening in the draw event
	image_alpha = 0;
}

fadein = false;
fadeout = false;

alarm[0] = DURATION *room_speed;

function fadeIn(){
	fadein = true;	
	instance_create_depth(0,0,0, oStars);
}

fadeIn();

function fadeOut(){
	fadeout = true;
	oStars.fadeOut();
}

function complete(){
	instance_create_depth(0,0,0, oDay);
	oDay.Day(oMyWorldController);
	fadeOut();
}

function destroy(){
	instance_destroy(self);	
}


