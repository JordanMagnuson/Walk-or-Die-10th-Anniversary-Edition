event_inherited();

switch(oLocation.locationType){
	case "forest":
		image_index = choose(sprForestMountain01, sprForestMountain02);
		break;
	case "desert":
		image_index = choose(sprDesertMountain01, sprDesertMountain02);
		break;
	case "snow":
		image_index = choose(sprSnowMountain01, sprSnowMountain02);
		break;
	case "plains":
		image_index = choose(sprPlainsMountain01, sprPlainsMountain02);
		break;
	case "beach":
		image_index = choose(sprBeachMountain01, sprBeachMountain02);
	default:
		image_index = choose(sprForestMountain01, sprForestMountain02);
}
type = "mountain";
Item(image_index, "far", true);
