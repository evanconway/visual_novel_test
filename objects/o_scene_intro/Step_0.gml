/// @description Insert description here
// You can write your code in this editor

var n = 0;

if (step == n++) {
	if (keyboard_check_pressed(vk_space)) {
		color = c_white;
		character_square = s_square_up;
		textbox.set_alignments(fa_bottom, fa_center, fa_top, fa_left);
		textbox.set_text("Hello there. I'm square!");
		textbox.advance();
		step++;
	}
} else if (step == n++) {
	if (keyboard_check_pressed(vk_space)) {
		color = c_red;
		character_square = s_square;
		textbox.set_text("And this is my buddy Triangle.");
		textbox.advance();
		step++;
	}
} else if (step == n++) {
	if (keyboard_check_pressed(vk_space)) {
		character_triangle = s_triangle_up;
		color = c_blue;
		textbox.set_text("Yup, that's me!");
		textbox.advance();
		step++;
	}
} else if (step == n++) {
	if (keyboard_check_pressed(vk_space)) {
		textbox.set_text("That's the end of our text.");
		character_triangle = s_triangle;
		textbox.advance();
		color = c_lime;
	}
}
