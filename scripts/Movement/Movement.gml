// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function ghostRandomPath(avoid) {
	rnd = irandom_range(0, 3);
	
	if (rnd == 0) {
		dir = 0;	
	}
	if (rnd == 1) {
		dir = 90;	
	}
	if (rnd == 2) {
		dir = 180;
	}
	if (rnd == 3) {
		dir = 270;	
	}

	if (array_contains(avoid, dir)) {
		ghostRandomPath(avoid);
	}
	
	howarr = getIfOnlyPossibleDirection(dir);
	
	if (howarr[1] == false) {
		//show_message("Chose collision way, trying again");
		if ((dir == 0 && place_meeting(x + 32, y, Wall)) ||
		    (dir == 90 && place_meeting(x, y - 32, Wall)) ||
			(dir == 180 && place_meeting(x - 32, y, Wall)) ||
			(dir == 270 && place_meeting(x, y + 32, Wall))) {
				ghostRandomPath(avoid);
		}
	} else {
		dir = howarr[0];
	}
	
	return dir;
}


function getIfOnlyPossibleDirection(dir)
{
	
	hasOnlyWay = false;
	result = [];
	if ((place_meeting(x + 32, y, Wall)) &&
	    (place_meeting(x, y - 32, Wall)) &&
		(place_meeting(x - 32, y, Wall))) {
			show_message("blocked, going DOWN");
		dir = 270;
		hasOnlyWay = true;
	}
	if ((place_meeting(x, y - 32, Wall)) &&
		(place_meeting(x - 32, y, Wall)) &&
		(place_meeting(x, y + 32, Wall))) {
			show_message("blocked, going RIGHT");
		dir = 0;
		hasOnlyWay = true;
	}
	if ((place_meeting(x - 32, y, Wall)) &&
		(place_meeting(x, y + 32, Wall)) &&
		(place_meeting(x + 32, y, Wall))) {
			show_message("blocked, going UP");
		dir = 90;
		hasOnlyWay = true;
	}
	if ((place_meeting(x, y - 32, Wall)) &&
		(place_meeting(x, y + 32, Wall)) &&
		(place_meeting(x + 32, y, Wall))) {
			show_message("blocked, going LEFT");
		dir = 180;
		hasOnlyWay = true;
	}
	array_push(result, dir);
	array_push(result, hasOnlyWay);
	return result;
}


function getAvoidOppositeDirectionArray(dir)
{
	avoid = [];
	if (dir == 0) {
		array_push(avoid, 180);
	}
	if (dir == 90) {
		array_push(avoid, 270);
	}
	if (dir == 180) {
		array_push(avoid, 0);
	}
	if (dir == 270) {
		array_push(avoid, 90);
	}
	return avoid;
}