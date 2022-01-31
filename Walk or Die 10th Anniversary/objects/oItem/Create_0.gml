distance = "";

moveDist = 0;
moveCounter = 0;

overlap = false;

function Item(sprite, distance = "mid", overlap = true){
	self.distance = distance;			
	self.overlap = overlap;
	sprite_index = sprite; 
	if (random(1) > 0.5){
		image_xscale = -1;
	}			
			
	// Hit box to bottom left, so we can place all items at same starting location		
	sprite_set_offset(sprite_index, 0,sprite_height);
	sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);
	
	// Create every item at the far right edge of the screen
	//x = room_width + 10;
	//y = 175; //hard coded, this should be oGround.y
			
	// Layer
	switch (distance){
		case "close":
			depth = choose(-100, -101);
			break;
		case "mid":
			depth = choose(10, 11);
			break;
		case "far":
			depth = choose(100, 101);
			break;
	}
	
/**
	* When an item is added to the world, check to see if it can overlap 
	* others of its type. If not, and it is overlapping, remove it.
*/
	 if(overlap == false){
		if(place_meeting(x,y, self.type)){
			instance_destroy(self);
			show_debug_message("Destroyed self due to overlap");
		}
	} 
}	

