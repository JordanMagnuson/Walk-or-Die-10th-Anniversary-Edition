if(x > -sprite_width/2){
	if(instance_exists(oPlayer) && oPlayer.walking){
		if(oMyWorldController.fourthFrame == 1){
			x -= (oPlayer.SPEED/50);
		}
	}
}
else if(variable_instance_exists(oMyWorldController, "oldGround")){
	if(self == oMyWorldController.ground){
		if(x < -sprite_width){
			show_debug_message("x: " + string(x) + " -SpriteWidth: " + string(-sprite_width));
			instance_destroy(oMyWorldController.oldGround)
		}
	}
}