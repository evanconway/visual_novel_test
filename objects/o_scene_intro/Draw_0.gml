/// @description Insert description here
// You can write your code in this editor

draw_set_color(color);
draw_text(30, 30, "Square: " + string(character_square));
draw_text(30, 50, "Triangle: " + string(character_triangle));

var stretch = 400;
var y_pos = 0;

draw_sprite_stretched(character_square, 0, 100, y_pos, stretch, stretch);
draw_sprite_stretched(character_triangle, 0, 400, y_pos, stretch, stretch);
