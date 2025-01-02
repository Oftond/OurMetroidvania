depth = -9999
text_box_id = layer_sequence_create("GUI", camera_get_view_x(view_camera[0]) + global.CameraWidth / 2, camera_get_view_y(view_camera[0]) + global.CameraHeight / 2, seq_dialogueStart);

textbox_width = 1165;
textbox_height = 295;
border = 25;
line_sep = 50;
line_width = textbox_width - border * 2;
textbox_x_centre = 44;
sprites[0, 0] = "";

page_qty = 0;
page_num = 0;
phrases[0] = "";
phrase_length = string_length(phrases[page_num]);
char_qty = 0;
text_spd = 1;
current_char[0, 0] = "";
char_x_pos[0, 0] = 0;
char_y_pos[0, 0] = 0;

choice[0] = "";
answer[0] = noone;
choice_pos = 0;
choice_qty = 0;

choice_x_pos = 0;
choice_speed = 1;
choice_delay = 0;
cursor_x_pos = 0;
cursor_speed = 1;

setup = false;
space = 0;
timer_pouse = 0;
time_pouse = 16;
snd_delay = 4;
snd_count = snd_delay;
DialogueSettingsDefault();