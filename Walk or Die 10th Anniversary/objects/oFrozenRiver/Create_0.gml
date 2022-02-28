event_inherited();

Item(sprFrozenRiver, "mid", true);
type = oFrozenRiver;
depth = 9;

// Hit box to bottom left, so we can place all items at same starting location		
if (image_xscale == 1) {
	sprite_set_offset(sprite_index, 0, 3);
}
else {
	// If the sprite is flipped, we need to set it's origin to -sprite_width instead of 0, to make up for the flip.
	sprite_set_offset(sprite_index, image_xscale*sprite_width, 3);
}
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, -sprite_height, bboxkind_rectangular,0);
sEmit6 = audio_emitter_create();