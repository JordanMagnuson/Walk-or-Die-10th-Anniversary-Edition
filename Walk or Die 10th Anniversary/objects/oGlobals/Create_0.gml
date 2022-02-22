// Debug?
global.debug = true;

//Globals for rare objects
oCastleSeen = false;
oPyramidsSeen = false;
oGiantPineSeen = false;
oFlowerTreeSeen = false;
oSnowmanSeen = false;

// Is this a touch device?
switch (os_type) {
	case os_ios:
	case os_android:
		global.is_touch_device = true;
		break;
	default:
		global.is_touch_device = false;
		break;
}