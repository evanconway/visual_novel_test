view_enabled = true;
view_visible[0] = true;
window_set_size(1280, 720);
display_set_gui_size(1280, 720);
surface_resize(application_surface, 1280, 720);

var _x = display_get_gui_width() / 2;
var _y = display_get_gui_height() - display_get_gui_height() / 16;
var _width = display_get_gui_width() / 2;
var _height = display_get_gui_height() / 3;

global.JTT_DEBUGGING = true;
global.JTT_DEFAULT_TYPING_CHIRP = snd_textbox_default;
textbox = jtt_create_box_typing_gui(_x, _y, _width, _height);
textbox.set_alignments(fa_bottom, fa_center, fa_top, fa_left);

choices = [];
choice_selected = -1; // for informing the system something was chosen
choice_highlighted = -1; // for selecting choices with kb/gp

mouse = [device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)];
mouse_prev = mouse;

mouse_using = false;
mouse_using_prev = false;

dialog_set_text = function(new_text) {
	textbox.set_text(new_text);
	textbox.advance();
}

/// @func set_choices(choices_array)
dialog_set_choices = function(_c) {
	choices = array_create(array_length(_c));
	var button_x = 100;
	var button_y = 100
	for (var i = 0; i < array_length(_c); i++) {
		choices[i] = create_button(button_x, button_y, _c[i]);
		button_y += (choices[i].label.textbox_height + 1);
		
	}
}

dialog_set_text("The quick brown fox jumps over the lazy dog.");
dialog_set_choices(["yes", "no", "maybe"]);
