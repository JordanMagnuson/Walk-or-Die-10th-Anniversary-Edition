y = 175;

function Ground(location){
	switch (location.type){
		case "forest":
			image_index = sprGroundForest;
			break;
		case "desert":
			image_index = sprGroundDesert
			break;
		case "snow":
			image_index = sprGroundSnow;
			break;
		case "plains":
			image_index = sprGroundPlains;
			break;		
		case "beach":
			image_index = sprGroundBeach;
			break;							
	}
			
	// Hit box			
	sprite_set_offset(sprite_index, 0,0);
	sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, 0, bboxkind_rectangular,0);
	
	// Starting location
	x = FP.screen.width;
	y = Ground.y;
			
	depth = 12;
}