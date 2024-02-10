/// @description Insert description here
// You can write your code in this editor




draw_set_colour(c_white);
draw_set_font(fnt_Arial);
draw_text(210, 210, "Player X: " + string(Player.x)); 
draw_text(210, 230, "Player Y: " + string(Player.y));

draw_text(210, 250, "Previous X: " + string(Player.previousX)); 
draw_text(210, 270, "Previous Y: " + string(Player.previousY));

draw_text(210, 290, "Modulo X: " + string(Player.x mod 64)); 
draw_text(210, 310, "Modulo Y: " + string(Player.y mod 64));












