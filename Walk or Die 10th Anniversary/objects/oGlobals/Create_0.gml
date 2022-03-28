// Object used to initialize some global variables. 
// This is new from original AS3 source code.

// Debug?
global.debug = false;
global.show_bounding_boxes = false;

// Player globals.
global.player_speed = 100;

//Globals for rare objects
global.oCastleSeen = false;
global.oPyramidsSeen = false;
global.oGiantPineSeen = false;
global.oFlowerTreeSeen = false;
global.oSnowmanSeen = false;

// Use smooth (sub-pixel) scrolling, or retro-style integer pixel scrolling?
// This option is new from original AS3 source (which used integer pixel scrolling).
global.smooth_scrolling = true;

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