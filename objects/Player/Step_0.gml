/// @description Insert description here
// You can write your code in this editor


speed = 0;
MARGIN_THRESHOLD = 5;




if (!PLAYER_DOING_MOVE && keyboard_check_direct(ord("A")))
{	
	if (place_meeting(x-MARGIN_THRESHOLD, y, Wall) == false) {
        direction = 180;
		PLAYER_DOING_MOVE = true;
    }
}

if (!PLAYER_DOING_MOVE && keyboard_check_direct(ord("D")))
{	
	if (place_meeting(x+MARGIN_THRESHOLD, y, Wall) == false) {
         direction = 0;
		 PLAYER_DOING_MOVE = true;
    }
}

if (!PLAYER_DOING_MOVE && keyboard_check_direct(ord("S")))
{	
	if (place_meeting(x, y+MARGIN_THRESHOLD, Wall) == false) {
        direction = 270;
		PLAYER_DOING_MOVE = true;
    }
}

if (!PLAYER_DOING_MOVE && keyboard_check_direct(ord("W")))
{	
	if (place_meeting(x, y-MARGIN_THRESHOLD, Wall) == false) {
        direction = 90;
		PLAYER_DOING_MOVE = true;
    }
}


if (PLAYER_DOING_MOVE == true) {
	speed = PLAYER_SPEED;
	//show_message("rychlost: " + string(speed));
}



// Tady bude podminka, ze player dojel na pozici (souradnice delitelne 64 ci jaka je width cellu)
// ..... TODO .....
if ((x != Player.previousX || y != Player.previousY) && Player.x mod global.cellWidth == 0 && Player.y mod global.cellWidth == 0) {
    PLAYER_DOING_MOVE = false;
	speed = 0;
	//show_message("zastavuju, protoze cellpoint" + string(x) + ":" + string(y));
	Player.previousX = x;
	Player.previousY = y;
}














