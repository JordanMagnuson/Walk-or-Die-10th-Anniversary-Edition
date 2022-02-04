animationSpeed =1;
FADE_IN_DURATION = 5;
sprite_index = sprGravestone;
image_alpha = 0;
if(oLocation.locationType == "forest"){
	imageArray[5] = [0, 1, 2, 3, 4];
}
else if(oLocation.locationType == "snow"){
	imageArray[5] = [5, 6, 7, 8, 9];
}
if(oLocation.locationType == "desert"){
	imageArray[5] = [10, 11, 12, 13, 14];
}
if(oLocation.locationType == "plains"){
	imageArray[5] = [15, 16, 17, 18, 19];
}
if(oLocation.locationType == "beach"){
	imageArray[5] = [20, 21, 22, 23, 24];
}
image_speed = animationSpeed;
x = 57;
y = oGround.y;

//hit box
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, -sprite_height, 0, sprite_height, bboxkind_rectangular,0);
