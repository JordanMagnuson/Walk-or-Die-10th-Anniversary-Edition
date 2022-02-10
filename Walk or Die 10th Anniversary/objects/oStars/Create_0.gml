/// @description Insert description here
// You can write your code in this editor
randomize();


startedFadeOut = false;
releasedMeteorShower = false;

SHOOTING_STAR_FREQ = oNight.DURATION / 3 + 1;
METEOR_SHOWER_FREQ = oNight.FADE_IN_DURATION - 5;

sprite_index = sprStars;

alpha = 0;
depth = 500;

fadein = false;
fadeout = false;

alarm[0] = 2*room_speed;

function fadeIn(){
	fadein = true;	
}

fadeIn();

function releaseShootingStar(){
	if(!startedFadeOut){
		direction = choose(-1,1)
		if(random(1) < 0.15){
			instance_create_depth(0,0,0,oShootingStar);
			show_debug_message("released shooting star"); 
		}
	}
}

function releaseMeteorShower(){
	show_debug_message("release meteor shower chance");
	show_debug_message("releaseMeteorShower random: " + random(1));
	if(!oMeteorShower.SEEN){
		if(random(1) < 0.1){
			oMeteorShower.SEEN = true;
			instance_create_depth(0,0,0, oMeteorShower);
		}
	}
}

function fadeOut(){
	fadeout = true;	
}

function destory(){
	instance_destory(self);
}



