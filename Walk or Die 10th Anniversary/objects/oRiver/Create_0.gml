fadeIn = false;
fadeOut = false;
fadeStarted = false;

sprite_index = sprRiver;
type = oRiver;
oItem.Item(sprRiver, "mid", false);
image_speed = 10;

depth = 9;

// Hit box to bottom left, so we can place all items at same starting location		
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);

sEmit5 = audio_emitter_create();
audio_emitter_gain(sEmit5, 0);
audio_emitter_position(sEmit5, 1,0,0);

