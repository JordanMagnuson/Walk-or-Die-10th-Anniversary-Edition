DURATION = 30;
FADE_IN_DURATION = 6* room_speed;
FADE_OUT_DURATION = 10 * room_speed;
MAX_ALPHA = 0.7;

sprite_index = sprNightCover;

function Night(){
	oMyWorldController.time = "night";
	depth = -999
	//blending is happening in the draw event
	image_alpha = MAX_ALPHA;//should be set to 0 for fading, temporarily set to MAX_ALPHA
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
	destroy();//TEMPORARILY ADDED WHILE FADING IS OFF
}

function destroy(){
	instance_destroy(self);	
}


