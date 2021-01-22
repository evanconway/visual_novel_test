/// @description Insert description here
// You can write your code in this editor

draw_set_color(color);
draw_text(30, 30, "Step: " + string(step));

var stretch = 400;

draw_sprite_stretched(character_square, 0, 100, 100, stretch, stretch);
draw_sprite_stretched(character_triangle, 0, 400, 100, stretch, stretch);
