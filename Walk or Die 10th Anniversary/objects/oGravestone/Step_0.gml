if (image_alpha < 1){
	image_alpha += (1/FADE_IN_DURATION)/room_speed;	
}
if(oLocation.locationType == "forest" and image_index <= 5){
	image_index = 4;
	image_speed = 0;
}
if(oLocation.locationType == "snow" and image_index <= 10){
	image_index = 9;
	image_speed = 0;
}
if(oLocation.locationType == "desert" and image_index <= 15){
	image_index = 14;
	image_speed = 0;
}
if(oLocation.locationType == "plains" and image_index <= 20){
	image_index = 19;
	image_speed = 0;
}
if(oLocation.locationType == "beach" and image_index == 0){
	image_index = 24;
	image_speed = 0;
}