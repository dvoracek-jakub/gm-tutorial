

if ((x != Ghost.previousX || y != Ghost.previousY) && Ghost.x mod global.cellWidth == 0 && Ghost.y mod global.cellWidth == 0) {
	Ghost.previousX = x;
	Ghost.previousY = y;

	avoid = getAvoidOppositeDirectionArray(direction);
	direction = ghostRandomPath(avoid);	
}