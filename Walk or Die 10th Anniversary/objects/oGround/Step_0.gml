if(x > -sprite_width/2){
	if(oPlayer.walking){
		x -= (oPlayer.SPEED/50);
	}
}
else if(oMyWorldController.oldGround){
	if(this == oMyWorldController.ground){
		instance_destroy(oMyWorldController.oldGround);
	}
}