if (!layer_sequence_is_finished(text_box_id))
	exit;
textbox_x = camera_get_view_x(view_camera[0]) + 310;
textbox_y = camera_get_view_y(view_camera[0]) + 70;

if (setup == false)
{
	setup = true
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	for(var i = 0; i < page_qty; i++)
	{
		var _inside_slash = false;
		var _num_sprite = 0;
		var _start_pos = string_pos("\\", phrases[i]);
		var _end_pos = string_pos_ext("\\", phrases[i], _start_pos + 1);
		for(var j = 0; j < string_length(phrases[i]); j++)
		{
			var _temp_sprite_name = "";
			var _char_num = j + 1;
			var _current_char = string_char_at(phrases[i], _char_num);
			if(_start_pos != 0 && _end_pos != 0)
			{
				_temp_sprite_name = string_copy(phrases[i], _start_pos + 1, _end_pos - _start_pos - 1);
				phrases[i] = string_delete(phrases[i], _start_pos + 1, _end_pos - _start_pos);
				sprites[i, _num_sprite] = _temp_sprite_name;
				_num_sprite++;
				_start_pos = string_pos_ext("\\", phrases[i], _start_pos + 1);
				_end_pos = string_pos_ext("\\", phrases[i], _start_pos + 1);
			}
		}
		phrase_length[i] = string_length(phrases[i]);
		
		if (face_sprite[i] == noone)
		{
			phrase_shift[i] = 0
		}
		else
		{
			phrase_shift[i] = 225
		}
		
		var _line_break_num = 0;
		
		for(var j = 0; j < phrase_length[i]; j++)
		{
			var _char_num = j + 1;
			current_char[j, i] = string_char_at(phrases[i], _char_num);
			var _phrase_qty_char = string_copy(phrases[i], 1, _char_num);
			var _current_phrase_width = string_width(_phrase_qty_char) - string_width(current_char[j, i]);
			
			if (current_char[j, i] == " ")
			{
				space = _char_num + 1;
			}
			
			if (_current_phrase_width - line_break_default[i] > line_width - phrase_shift[i])
			{
				line_break_pos[_line_break_num, i] = space;
				_line_break_num++;
				var _phrase_to_space = string_copy(phrases[i], 1, space);
				var _space_string = string_char_at(phrases[i], space);
				line_break_default[i] = string_width(_phrase_to_space) - string_width(_space_string);
			}
		}
		
		for(var j = 0; j < phrase_length[i]; j++)
		{
			var _sprite_num = 0;
			var _phrase_line = 0;
			var _char_num = j + 1;
			var _phrase_x_pos = textbox_x + textbox_x_centre + phrase_shift[i] + border;
			var _phrase_y_pos = textbox_y + border;
			var _phrase_qty_char = string_copy(phrases[i], 1, _char_num);
			var _current_phrase_width = string_width(_phrase_qty_char) - string_width(current_char[j, i]);
			
			for (var l = 0; l < _line_break_num; l ++)
			{
				if (_char_num >= line_break_pos[l, i])
				{
					_phrase_line = l + 1;
					var _string_copy = string_copy(phrases[i], line_break_pos[l, i], _char_num - line_break_pos[l, i])
					_current_phrase_width = string_width(_string_copy);
				}
			}
			
			char_x_pos[j, i] = _phrase_x_pos + _current_phrase_width;
			char_y_pos[j, i] = _phrase_y_pos + _phrase_line * line_sep;
		}
	}
}

if (timer_pouse <= 0)
{
	if (char_qty < phrase_length[page_num])
	{
		char_qty += text_spd;
		char_qty = clamp(char_qty, 0, phrase_length[page_num]);
	
		var _check_char = string_char_at(phrases[page_num], char_qty);
		if (_check_char == "." || _check_char == "," || _check_char == "!" || _check_char == "?")
		{
			timer_pouse = time_pouse;
		}
	}
}
else
{
	timer_pouse--;
}

if (InputPressed(Input.accept))
{
	if (char_qty == phrase_length[page_num])
	{
		if (page_num < page_qty - 1)
		{
			page_num++;
			char_qty = 0;
		}
		else
		{
			if (choice_qty > 0)
			{
				DialogueStart(who_is_speaked[choice_pos], answer[choice_pos]);
			}
			instance_destroy();
		}
	}
	else
	{
		char_qty = phrase_length[page_num];
	}
}

var _is_choice = false;

var _textbox_x = textbox_x + textbox_x_centre;
var _textbox_y = textbox_y;

var _cursor_dialogue_x = textbox_x + obj_textBox_border.sprite_width / 2;
var _cursor_dialogue_y = textbox_y + textbox_height - 30;

//textbox_sprite_widh = sprite_get_width(textbox_sprite);
//textbox_sprite_height = sprite_get_height(textbox_sprite);

//draw_sprite_ext(textbox_sprite, 0, _textbox_x, _textbox_y, textbox_width / textbox_sprite_widh,
//textbox_height / textbox_sprite_height, 0, c_white, 1);

//if (face_sprite[page_num] != noone)
//{
//	sprite_index = face_sprite[page_num];
//	if (char_qty == phrase_length[page_num])
//	{
//		image_index = 0;
//	}
//	var _speaker_x_pos = textbox_x + 80
//	draw_sprite(sprite_index, image_index, _speaker_x_pos, _textbox_y + 40);
//}

if (char_qty == phrase_length[page_num] && page_num == page_qty - 1)
{
	choice_pos += InputPressed(Input.down) - InputPressed(Input.up) + InputStickVerticalPressed();
	choice_pos = clamp(choice_pos, 0, choice_qty - 1);

	var _choice_space = 120;
	var _choice_border = 12;
	var _num_choice = 0;
	var _max_length_choice = 0;
	
	for (var i = 0; i < choice_qty; i++)
	{
		var _choice_length = string_length(choice[i]);
		if (_choice_length > _max_length_choice)
		{
			_max_length_choice = _choice_length;
			_num_choice = i;
			_is_choice = true;
		}
	}
	var _choice_width = string_width(choice[_num_choice]) + _choice_border * 14;
	
	//draw_sprite_ext(textbox_sprite, 0, _textbox_x, _textbox_y - _choice_space *
	//	choice_qty - 10, (_choice_width / textbox_sprite_widh),
	//	(_choice_space * choice_qty) / textbox_sprite_height, 0, c_white, 1);
	
	for (var i = 0; i < choice_qty; i++)
	{
		if (choice_pos == i)
		{
			draw_sprite(spr_choice_0, 0, _textbox_x + choice_x_pos + 35, _textbox_y - _choice_space * choice_qty +
			_choice_space * i + 30)
			
			if (choice_x_pos < -4 || choice_x_pos > 8)
			{
				if (choice_delay <= 0)
				{
					choice_speed *= -1;
					choice_delay = 8;
				}
				if (choice_delay > 0)
				{
					choice_delay--;
				}
			}
			if (choice_delay <= 0)
			{
				choice_x_pos += choice_speed / 2;
			}
		}
		draw_text(_textbox_x + 95 + _choice_border, _textbox_y - _choice_space * choice_qty +
		_choice_space * i + 30, choice[i]);
	}
}

if (char_qty == phrase_length[page_num] && _is_choice == false)
{
	cursor_x_pos += (cursor_speed / 4) * 2;
	
	if (cursor_x_pos > 4 || cursor_x_pos < -4)
	{
		cursor_speed *= -1;
	}
	draw_sprite(spr_cursordialogue_0, 0, _cursor_dialogue_x, _cursor_dialogue_y + cursor_x_pos);
}

var _sprite_num = 0;
for(var i = 0; i < char_qty; i++)
{
	var _float_y = 0;
	if (wavy_words[i, page_num] == true)
	{
		wavy_dir[i, page_num] += 6;
		_float_y = dsin(wavy_dir[i, page_num]) * 7
	}
	
	var _shake_x = 0;
	var _shake_y = 0;
	if (shake_chars[i, page_num] == true)
	{
		shake_timer[i, page_num]--;
		if (shake_timer[i, page_num] <= 0)
		{
			shake_timer[i, page_num] = irandom_range(4, 8);
			shake_dir[i, page_num] = irandom(360);
		}
		if (shake_timer[i, page_num] <= 4)
		{
			_shake_x = lengthdir_x(1, shake_dir[i, page_num]) * 3;
			_shake_y = lengthdir_y(1, shake_dir[i, page_num]) * 3;
		}
	}
	
	var _char_num = i + 1;
	var _current_char = string_char_at(phrases[page_num], _char_num);
	
	if (_current_char == "\\")
	{
		var _sprite_to_draw = asset_get_index(sprites[page_num, _sprite_num]);
		draw_sprite(_sprite_to_draw, 0, char_x_pos[i, page_num], char_y_pos[i, page_num] + 4);
		_sprite_num++;
	}
	else
	{
		draw_text_color(char_x_pos[i, page_num] + _shake_x, char_y_pos[i, page_num] + _float_y + _shake_y, current_char[i, page_num], color_1[i, page_num], color_2[i, page_num], color_3[i, page_num], color_4[i, page_num], 1);
	}
}