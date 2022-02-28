if(global.debug and keyboard_check_pressed(ord("B"))) {
	with(instance_create_depth(room_width+10, 175, 0, oBarrenTree)) {
		show_debug_message("Created barren tree with id: " + string(id));
	}
}
