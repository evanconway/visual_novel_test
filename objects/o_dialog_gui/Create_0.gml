view_enabled = true;
view_visible[0] = true;
window_set_size(1280, 720);
display_set_gui_size(1280, 720);
surface_resize(application_surface, 1280, 720);

var _x = display_get_gui_width() / 2;
var _y = display_get_gui_height() - display_get_gui_height() / 16;
var _width = display_get_gui_width() / 2;
var _height = display_get_gui_height() / 3;

global.JTT_DEBUGGING = false;
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

dialog_tree = new game_tree();

/// @desc Populate gui with data from current tree state
dialog_set_data = function() {
	var data = dialog_tree.tree_get_data();
	var _choices = [];
	
	/*
	To make life easier, data for steps in dialog can be one of two things: A string, or an
	array of strings. If the data is just a string, there will be no choices, and the
	textbox will be populated with the given string. If data is an array of strings. The 
	textbox will be populated with string at index 0, and the remaining entries will be
	choices for the textbox.
	*/
	
	if (is_string(data)) {
		dialog_set_text(data);
	}
	
	if (is_array(data)) {
		dialog_set_text(data[0]);
		// branch choices are all remaining options
		for (var i = 1; i < array_length(data); i++) {
			array_push(_choices, data[i]);
		}
	}
	
	dialog_set_choices(_choices);
}

/// @func dialog_set_text(new_text)
dialog_set_text = function(new_text) {
	textbox.set_text(new_text);
	textbox.advance();
}

/// @func dialog_set_choices(choices_array)
dialog_set_choices = function(_c) {
	// clear old buttons
	for (var i = 0; i < array_length(choices); i++) {
		instance_destroy(choices[i]);
	}
	choices = array_create(array_length(_c));
	var button_x = 100;
	var button_y = 100
	for (var i = 0; i < array_length(_c); i++) {
		choices[i] = create_button(button_x, button_y, _c[i]);
		choices[i].set_active(false);
		button_y += (choices[i].label.textbox_height + 1);
	}
}

/*
0: A [1]
1: B [2]
2: C [3, 16]

	3: D [4]
	4: E [5]
	5: F [6, 9]
	
		6: G [7, 8]
		
			7: H [15]
			
			8: I [15]
		
		9: J [10]
		10: K [11, 13]
		
			11: L [12]
			12: M [14]
			
			13: N [14]
		14: O [15]
	15: P [19]
		
	16: Q [17]
	17: R [18]
	18: S [19]
19: T [20]
20: U
*/

with (dialog_tree) {
	add("A");
	add("B");
	add(["C", "D", "Q"], function() {
		add("D");
		add("E");
		add(["F", "G", "J"], function() {
			add(["G", "H", "I"], function() {
				add("H");
			}, function() {
				add("I");
			});
		}, function() {
			add("J");
			add(["K", "L", "N"], function() {
				add("L");
				add("M");
			}, function() {
				add("N");
			});
			add("O");
		});
		add("P");
	}, function() {
		add("Q");
		add("R");
		add("S");
	});
	add("T");
	add("U");
}

dialog_set_data();