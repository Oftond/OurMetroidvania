if (keyboard_check_pressed(vk_control) && !instance_exists(obj_textbox))
{
	DialogueStart(CharactersName.sardar, Situations.place_1);
	obj_player.change_state(STATES.IDLE);
}

if (InputPressed(Input.fullscreen))
	window_set_fullscreen(!window_get_fullscreen());