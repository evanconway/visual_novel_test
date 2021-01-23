/// @description Insert description here
// You can write your code in this editor

var n = 0;
var p = 0;

if (path == p++) {
	if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				character_square = s_square_up;
				textbox.set_alignments(fa_bottom, fa_center, fa_top, fa_left);
				textbox.set_text("Hello there. I'm square!");
				step++;
			}
			textbox.advance();
		}
	} else if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				character_square = s_square;
				textbox.set_text("And this is my buddy Triangle.");
				step++;
			}
			textbox.advance();
		}
	} else if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				character_triangle = s_triangle_up;
				textbox.set_text("Yup, that's me!");
				step++;
			}
			textbox.advance();
		}
	} else if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				textbox.set_text("Press ENTER to choose one of the 3 numbers:");
				character_triangle = s_triangle;
				step++;
			}
			textbox.advance();
		}
	} else if (step == n++) {
		if (textbox.get_typing_all_finished() || keyboard_check_pressed(vk_space)) {
			textbox.set_text("Press ENTER to choose one of the 3 numbers:<n><yellow pulse>1<><n>2<n>3");
			textbox.advance();
			textbox.set_typing_page_finished();
			choice = 0;
			step++;
		}
	} else if (step == n++) {
		var choice_change = false;
		if (keyboard_check_pressed(vk_up) && choice > 0) {
			choice--;
			choice_change = true;
		}
		if (keyboard_check_pressed(vk_down) && choice < 2) {
			choice++;
			choice_change = true;
		}
	
		if (choice_change) {
			if (choice == 0) {
				textbox.set_text("Press ENTER to choose one of the 3 numbers:<n><yellow pulse>1<><n>2<n>3");
			}
			if (choice == 1) {
				textbox.set_text("Press ENTER to choose one of the 3 numbers:<n>1<n><yellow pulse>2<><n>3");
			}
			if (choice == 2) {
				textbox.set_text("Press ENTER to choose one of the 3 numbers:<n>1<n>2<n><yellow pulse>3<>");
			}
			textbox.advance();
			textbox.set_typing_page_finished();
		}
	
		if (keyboard_check_pressed(vk_enter)) {
			var number = undefined;
			if (choice == 0) number = 1;
			if (choice == 1) number = 2;
			if (choice == 2) number = 3;
			textbox.set_text("You chose number " + string(number) + ". Now you're on dialog path " + string(number) + "!");
			textbox.advance();
			step = 0;
			path = number;
		}
	}
} else if (path == p++) {
	if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				textbox.set_text("In this path, everything is bad.");
				step++;
			}
			textbox.advance();
		}
	} else if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				textbox.set_text("Sorry to give you the bad news.");
				step = 0;
				path = 4;
			}
			textbox.advance();
		}
	}
} else if (path == p++) {
	if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				textbox.set_text("On this path, things are neutral.");
				step++;
			}
			textbox.advance();
		}
	} else if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				textbox.set_text("Not good not great I suppose?");
				step = 0;
				path = 4;
			}
			textbox.advance();
		}
	}
} else if (path == p++) {
	if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				textbox.set_text("Luckily, you've chosen the good path.");
				step++;
			}
			textbox.advance();
		}
	} else if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				textbox.set_text("Everything is sunshine and rainbows here.");
				step = 0;
				path = 4;
			}
			textbox.advance();
		}
	}
} else if (path == p++) {
	if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				textbox.set_text("Good luck on the next run!");
				step++;
			}
			textbox.advance();
		}
	} else if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (textbox.get_typing_all_finished()) {
				textbox.set_text("Press R to restart.");
				step++;
			}
			textbox.advance();
		}
	} else if (step == n++) {
		if (keyboard_check_pressed(vk_space)) {
			if (!textbox.get_typing_all_finished()) {
				textbox.advance();
			}
		}
	}
}
