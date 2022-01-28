/// @description Insert description here
// You can write your code in this editor
randomise();

SEEN = false;
MAX_SHOOTING_STARS = 55;
MIN_SHOOTING_STARS = 30

MIN_TIME_BETWEEN = 0.1;
MAX_TIME_BETWEEN = 0.7;

starsReleased = 0;

function MeteorShower()
{
	numOfStars = MIN_SHOOTING_STARS + (random(0.1)*(MAX_SHOOTING_STARS - MIN_SHOOTING_STARS));
	show_debug_message("stars to release: " + numOfStars);   
	direction = choose(-1,1);
}

function releaseStar()
{
	starsReleased += 1;
	show_debug_message("stars released: " + starsReleased); 
	
}
function changeTimeBetween()
{
	timeBetween = MIN_TIME_BETWEEN + random(0.1) * (MAX_TIME_BETWEEN - MIN_TIME_BETWEEN);
}