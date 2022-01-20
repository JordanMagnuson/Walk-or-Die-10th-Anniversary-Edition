if(x > -sprite_width/2){
	if(oPlayer.walking){
		x -= (oPlayer.SPEED/50);
	}
}
else if(variable_instance_exists(oMyWorldController, "oldGround")){
	if(self == oMyWorldController.ground){
		instance_destroy(oMyWorldController.oldGround);
	}
}