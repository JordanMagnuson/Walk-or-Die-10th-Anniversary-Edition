if (global.debug) {
	if(keyboard_check_pressed(ord("C"))){
		changeLocation();
	}
	if(keyboard_check_pressed(ord("N"))){
		advanceTime();
	}
	if(keyboard_check_pressed(ord("1"))){
		changeLocationCheat("beach");
	}
	if(keyboard_check_pressed(ord("2"))){
		changeLocationCheat("desert");
	}if(keyboard_check_pressed(ord("3"))){
		changeLocationCheat("forest");
	}
	if(keyboard_check_pressed(ord("4"))){
		changeLocationCheat("plains");
	}
	if(keyboard_check_pressed(ord("5"))){
		changeLocationCheat("snow");
	}
}

oddFrame *= -1;

if(thirdFrame == 3)
{
	thirdFrame = 1;
}
else
{
	thirdFrame += 1;
}

if(fourthFrame == 4)
{
	fourthFrame = 1;
}
else
{
	fourthFrame += 1;
}
