/// @description Insert description here
// You can write your code in this editor

//HOW CLOUD RELEASE RATE CHANGES
MAX_CLOUD_RELEASE_TIME = 10;
MIN_CLOUD_RELEASE_TIME = 0.5;
CLOUD_COVER_CHANGE_RATE = 0.5;
CLOUD_COVER_CHANGE_TIME = 5;

//WHEN A CLOUD IS RELEASED
cloudReleaseTimer = 1;

//whether cloud cover is increasing or decreasing. 0, 1, or -1
cloudCoverSlope = 0;

image = sprSky;

function Sky()
{
	cloudReleaseTime = MIN_CLOUD_RELEASE_TIME + random(0.1) * (MAX_CLOUD_RELEASE_TIME - MIN_CLOUD_RELEASE_TIME);
	cloudCoverSlope = choose(1,-1);
	
	graphic = image;
	depth = 999;
	alarm[0] = cloudReleaseTime * room_speed;
	alarm[1] = CLOUD_COVER_CHANGE_TIME * room_speed;
}

function releaseCloud(){
	alarm[0] = cloudReleaseTime * room_speed;
	cloudBeingReleased = instance_create_depth(0, 0, 0, oCloud);
}

function changeCloudCover(){
	alarm[1] = CLOUD_COVER_CHANGE_TIME * room_speed;
	switch(cloudCoverSlope){
		case 1:
			if(cloudReleaseTime > MIN_CLOUD_RELEASE_TIME)
			{
				cloudReleaseTime -= CLOUD_COVER_CHANGE_RATE	
			}
			if(cloudReleaseTime < MIN_CLOUD_RELEASE_TIME * 3)
			{
				if(random(1)> 0.8)
				{
					cloudCoverSlope = -1;	
				}
			}
			break;
		case 0:
			if(choose(1,2) == 1)
			{
				if(random(1) > 0.6)
				{
					cloudCoverSlope = -1;
				}
			}
			else
			{
				if(random(1) > 0.8)
				{
					cloudCoverSlope = 1;	
				}
			}
			break;
		case -1:
			if(cloudReleaseTime < MAX_CLOUD_RELEASE_TIME)
			{
				cloudReleaseTime += CLOUD_COVER_CHANGE_RATE;
			}
			if(cloudReleaseTime > MAX_CLOUD_RELEASE_TIME * 0.6)
			{
				if(random(1) > 0.8)
				{
					cloudCoverSlope = 1;	
				}
			}
			break;
		if(cloudReleaseTime < MIN_CLOUD_RELEASE_TIME)
		{
			cloudReleaseTime = MIN_CLOUD_RELEASE_TIME	
		}
		else if (cloudReleaseTime > MAX_CLOUD_RELEASE_TIME)
		{
			cloudReleaseTime = MAX_CLOUD_RELEASE_TIME;	
		}
	}
}