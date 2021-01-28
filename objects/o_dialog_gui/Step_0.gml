/// @description Insert description here
// You can write your code in this editor

mouse = [device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)];

if (keyboard_check_pressed(vk_anykey)) {
	mouse_using = false;
}

var _mouse_moved = (mouse[0] != mouse_prev[0] || mouse[1] != mouse_prev[1]);

if (_mouse_moved) {
	mouse_using = true;
}

choice_selected = -1;

if (mouse_using) {
	window_set_cursor(cr_default);
	choice_highlighted = -1;
	for (var i = 0; i < array_length(choices); i++) {
		var _button = choices[i];
		with (_button) {
			set_highlight(get_mouse_hover());
			if (get_mouse_hover()) other.choice_highlighted = i;
			if (get_mouse_hover() && mouse_check_button_pressed(mb_left)) {
				other.choice_selected = i;
			}
		}
	}
} else {
	window_set_cursor(cr_none);
	/*
	On the first frame the user changes from mouse input to keyboard input, we
	want to ignore the input if there is no choice highlighted. This creates a 
	clearer user experience. 
	*/
	if (choice_highlighted < 0) choice_highlighted = 0;
	else {
		if (keyboard_check_pressed(vk_up) && choice_highlighted > 0) choice_highlighted--;
		if (keyboard_check_pressed(vk_down) && choice_highlighted < array_length(choices) - 1) choice_highlighted++;
		if (keyboard_check_pressed(vk_enter)) choice_selected = choice_highlighted;
	}
	for (var i = 0; i < array_length(choices); i++) {
		var _button = choices[i];
		if (choice_highlighted == i) {
			_button.set_highlight(true);
		} else _button.set_highlight(false);
	}
}

mouse_prev = mouse;
mouse_using_prev = mouse_using;
