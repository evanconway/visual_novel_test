/// @description Insert description here
// You can write your code in this editor

if (choice_selected >= 0) {
	var draw_options = [draw_get_color(), draw_get_alpha()]
	draw_text(0, 0, "Choice Clicked: " + string(choice_selected));
	draw_set_color(draw_options[0]);
	draw_set_alpha(draw_options[1]);
}
