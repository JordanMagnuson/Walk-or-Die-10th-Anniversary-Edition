event_inherited();
if(oMyWorldController.fourthFrame == 4)
{
	x -= 1;	
}
if(image_xscale == -1){
	if(x < (0 + sprite_width)){
	instance_destroy(self); 
	}
}
else if (x < (0 - sprite_width))
{
	instance_destroy(self); 
	//show_debug_message("CLOUD GONE");
}
