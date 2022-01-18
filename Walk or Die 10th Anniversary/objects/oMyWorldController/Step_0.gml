if(keyboard_check_pressed("C")){
	changeLocation();
}
if(keyboard_check_pressed("N")){
	advanceTime();
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
