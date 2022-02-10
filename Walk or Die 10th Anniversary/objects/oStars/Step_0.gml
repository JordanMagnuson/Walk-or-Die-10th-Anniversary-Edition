/// @description Insert description here
// You can write your code in this editor
if(fadein == true)
	alpha += (1/FADE_IN_DURATION)/room_speed;
	
if(alpha >=1){
	fadein = false;
}
if(fadeout == true){
	if(alpha == 0)
		destroy();
	alpha -= (1/FADE_OUT_DURATION)/room_speed;
}
