event_inherited();
randomise();

//NEED TO FIND OUT APPROPRIATE HEIGHT
MAX_HEIGHT = 130;
MIN_HEIGHT = 20;
MAX_SPEED = 0.5;
MIN_SPEED = 0.1;

y = MIN_HEIGHT + random(1) * (MAX_HEIGHT - MIN_HEIGHT);
cloud_speed = MIN_SPEED * random(1) * (MAX_SPEED - MIN_SPEED);

//fix this later
mySpriteCollection = [sprCloud01, sprCloud02, sprCloud03, sprCloud04, sprCloud05, sprCloud06, sprCloud07, sprCloud08];
//rawSprite = choose(mySpriteCollection);

sprite_index = choose(sprCloud01, sprCloud02, sprCloud03, sprCloud04, sprCloud05, sprCloud06, sprCloud07, sprCloud08);
type = oCloud;
Item(sprite_index, "mid", true );
depth = 105;
