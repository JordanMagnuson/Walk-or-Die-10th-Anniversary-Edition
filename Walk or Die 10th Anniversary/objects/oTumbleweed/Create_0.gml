event_inherited();
sprite_index = sprTumbleweed;

type = oTumbleweed;
Item(sprite_index, "close", false);
image_speed = 5;

	
//hit box
if (image_xscale == 1) {
	sprite_set_offset(sprite_index, 0, sprite_height);
}
else {
	// If the sprite is flipped, we need to set it's origin to -sprite_width instead of 0, to make up for the flip.
	sprite_set_offset(sprite_index, image_xscale*sprite_width, sprite_height);
}
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);
 