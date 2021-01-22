/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_space)) {
	step++;
}

var n = 0;

if (step == n++) {
	color = c_white;
} else if (step == n++) {
	color = c_red;
	character_square = s_square_up;
} else if (step == n++) {
	character_square = s_square;
	color = c_blue;
} else if (step == n++) {
	character_triangle = s_triangle_up;
	color = c_lime;
}
