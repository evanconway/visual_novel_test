/// @description Insert description here
// You can write your code in this editor

view_enabled = true;
view_visible[0] = true;

var window_w = 800;
var window_h = 600;

window_set_size(window_w, window_h);
surface_resize(application_surface, window_w, window_h);
camera_set_view_size(view_camera[0], window_w, window_h);
display_set_gui_size(window_w, window_h);

step = 0;
color = c_white;
character_square = s_square;
character_triangle = s_triangle;

global.JTT_DEFAULT_FONT = f_test;
global.JTT_DEFAULT_TYPING_CHIRP = snd_textbox_default;
global.JTT_DEBUGGING = false;
textbox = jtt_create_box_typing_gui(window_w / 2, window_h, window_w / 1.5, 150);
textbox.set_alignments(fa_bottom, fa_center, fa_center, fa_center);
textbox.set_text("Press Space to begin!");
textbox.advance();
textbox.advance(); // start typed

choice = 0;
