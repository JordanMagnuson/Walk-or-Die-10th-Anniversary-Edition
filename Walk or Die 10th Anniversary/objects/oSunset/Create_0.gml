DURATION = 10;
FADE_IN_DURATION = 10;
FADE_OUT_DURATION = 20;
MAX_ALPHA = 0.8;

sprite_index = sprSunset;
fadein = false;
fadeout = false;

function Sunset(){
	oMyWorldController.time = "sunset";
	depth = -999;
	//blending is happening in the draw event
	image_alpha = 0;
	oSoundController.startNight();
}

show_debug_message("Sunset started");
alarm[0] = DURATION * room_speed;

function fadeIn(){
	fadein = true;	
}

fadeIn();

function fadeOut(){
	fadeout = true;	
}

function complete(){
	instance_create_depth(0,0,0, oNight);
	oNight.Night();
	fadeOut();
}

function destroy(){
	instance_destroy(self);	
}
	
	


