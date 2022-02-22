if(image_xscale == -1){
	if(x < (0 + sprite_width)){
	//show_debug_message("object destroyed, went offscreen, x = " + string(x));
	offScreenAction();
	}
}
else if(x < (0 - sprite_width)){
	//show_debug_message("object destroyed, went offscreen, x = " + string(x));
	offScreenAction();
}
				
if(instance_exists(oPlayer) && oPlayer.walking){
	switch(distance){
		case "mid": 
			//move mid distance objects exactly 1 pixel every other frame.
			if(oMyWorldController.oddFrame ==1){
				x -= oPlayer.SPEED/ 100;
			}
			break;
		case "close":
			//move close distance objects exatly 1 pixel every frame.
			x -= oPlayer.SPEED/100;
			break; 
		case "far":
			//move far distance objects exactly 1 pixel every third frame
			if(oMyWorldController.thirdFrame == 1){
				x -= oPlayer.SPEED/100;
			}
			break;
	}
}
/*
else{
	show_debug_message("OPLAYER ELSE STATEMENT");
}
*/

