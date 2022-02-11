DURATION = 10;
FADE_IN_DURATION = 10 ;
FADE_OUT_DURATION = 20* room_speed;
MAX_ALPHA = 0.8;
TEMPCOUNTER = 0;
sprite_index = sprSunset;
fadein = false;
fadeout = false;

function Sunset(){
	oMyWorldController.time = "sunset";
	depth = -999;
	image_alpha = MAX_ALPHA; //should be zero for fading in, temp set to MAX_ALPHA
	//blending is happening in the draw event
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
	destroy();//TEMPORARILY ADDED WHILE FADING IS OFF
}

function destroy(){
	instance_destroy(self);	
}
	
	


