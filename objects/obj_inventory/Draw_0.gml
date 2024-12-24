draw_self();
draw_set_font(global.Headings);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white)

if (obj_inventory_targetChoice.page == 0)
	draw_text(x, bbox_top + 80, "ЭКИПИРОВКА");
else if (obj_inventory_targetChoice.page == 1)
	draw_text(x, bbox_top + 80, "ЗАКЛИНАНИЯ");
else if (obj_inventory_targetChoice.page == 2)
	draw_text(x, bbox_top + 80, "КАРТА");

var _offset_x_tips = 450;
if (obj_inventory_targetChoice.page < obj_inventory_targetChoice.max_pages)
{
	draw_sprite(spr_input_keyboard_left, 0, x - 10 - sprite_get_width(spr_input_keyboard_down) - _offset_x_tips, bbox_bottom - 80);
	draw_sprite(spr_input_keyboard_right, 0, x + 10 + sprite_get_width(spr_input_keyboard_down) - _offset_x_tips, bbox_bottom - 80);
	draw_sprite(spr_input_keyboard_down, 0, x - _offset_x_tips, bbox_bottom - 80);
	draw_sprite(spr_input_keyboard_up, 0, x - _offset_x_tips, bbox_bottom - 90 - sprite_get_width(spr_input_keyboard_down));
	draw_set_font(global.Tips);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_text(x + 20 + (sprite_get_width(spr_input_keyboard_down) * 2) - _offset_x_tips, bbox_bottom - 80, "- ПЕРЕМЕЩЕНИЕ");
}
else
{
	draw_sprite(spr_input_keyboard_left, 0, x - 10 - sprite_get_width(spr_input_keyboard_down), bbox_bottom - 100);
	draw_sprite(spr_input_keyboard_right, 0, x + 10 + sprite_get_width(spr_input_keyboard_down), bbox_bottom - 100);
	draw_sprite(spr_input_keyboard_down, 0, x, bbox_bottom - 100);
	draw_sprite(spr_input_keyboard_up, 0, x, bbox_bottom - 110 - sprite_get_width(spr_input_keyboard_down));
	draw_set_font(global.Tips);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, bbox_bottom - 50, "ПЕРЕМЕЩЕНИЕ");
}

if (obj_inventory_targetChoice.page == 0)
{
	for (var i = 0; i < count_equip; i++)
	{
		var _x_pos = x + (i - (count_equip - 1) / 2) * ((sprite_get_width(spr_inventory_player_equip) * 2) + distance);
		var _y_pos = (bbox_top + (distance * 6)) + (sprite_get_width(spr_inventory_player_equip) * 2);
		var _amulet_equip = obj_player.inventory.equip_amulets[i];
		if (_amulet_equip != undefined)
		{
			draw_sprite(_amulet_equip.sprite, 0, _x_pos, _y_pos);
		}
		else
			draw_sprite(spr_inventory_player_equip, 0, _x_pos, _y_pos);
	}

	var _index_amulet = 0;
	for (var i = 0; i < count_equipment / max_in_row; i++)
	{
		for (var j = 0; j < max_in_row; j++)
		{	
			var _y_pos = (y + (distance * 3)) + (i - ((count_equipment / max_in_row) - 1) / 2) * (sprite_get_width(spr_inventory_player_equip) + (distance * 3));
			var _x_pos = x + (j - (max_in_row - 1) / 2) * ((sprite_get_width(spr_inventory_player_equip) * 2) + distance);
			var _amulet_choice = obj_player.inventory.amulets[_index_amulet];
			if (_amulet_choice != undefined)
				if (!_amulet_choice.is_equipped)
					draw_sprite(_amulet_choice.sprite, 0, _x_pos, _y_pos);
				else
					draw_sprite_ext(_amulet_choice.sprite, 0, _x_pos, _y_pos, 1, 1, 0, c_white, 0.4);
			else
				draw_sprite(spr_inventory_player_equip, 0, _x_pos, _y_pos);
			_index_amulet++;
		}
	}
}
else if (obj_inventory_targetChoice.page == 1)
{
	var _angle_step = 360 / obj_player.spells.max_number_spells;
	var _radius = 200;
	var _center_x = x;
	var _center_y = y;
	for (var i = 0; i < obj_player.spells.max_number_spells; i++)
	{
		var _angle = i * _angle_step;
		var _x_pos = _center_x + lengthdir_x(_radius, _angle);
		var _y_pos = _center_y + lengthdir_y(_radius, _angle);
		if (obj_player.spells.spells[i] != undefined)
		{
			draw_sprite(spr_spellIcon_holder, 0, _x_pos, _y_pos);
			if (!obj_player.spells.spells[i].is_equipped)
				draw_sprite(obj_player.spells.spells[i].icon, 0, _x_pos, _y_pos);
			else
				draw_sprite_ext(obj_player.spells.spells[i].icon, 0, _x_pos, _y_pos, 1, 1, 0, c_white, 0.4);
			draw_sprite(spr_spellIcon_border, 0, _x_pos, _y_pos);
		}
		else
		{
			draw_sprite(spr_spellIcon_holder, 0, _x_pos, _y_pos)
		}
	}
	
	if (obj_player.spells.spells[obj_inventory_targetChoice.selected_index] != undefined)
	{
		draw_sprite_ext(spr_spellIcon_holder, 0, _center_x, _center_y, 2, 2, 0, c_white, 1);
		draw_sprite_ext(obj_player.spells.spells[obj_inventory_targetChoice.selected_index].icon, 0, _center_x, _center_y, 2, 2, 0, c_white, 1);
		draw_sprite_ext(spr_spellIcon_border, 0, _center_x, _center_y, 2, 2, 0, c_white, 1);
	}
}
else if (obj_inventory_targetChoice.page == 2)
{
	minimap_draw();
}

if (obj_inventory_targetChoice.page + 1 <= obj_inventory_targetChoice.max_pages)
	current_phrase_right = phrases[obj_inventory_targetChoice.page + 1];
else
	current_phrase_right = phrases[0];

if (obj_inventory_targetChoice.page - 1 >= 0)
	current_phrase_left = phrases[obj_inventory_targetChoice.page - 1];
else
	current_phrase_left = phrases[obj_inventory_targetChoice.max_pages];

draw_sprite(spr_next_page, 0, bbox_right - 100, bbox_top + 70);
draw_sprite(spr_previous_page, 0, bbox_left + 100, bbox_top + 70);
draw_sprite(spr_input_keyboard_q, 0, bbox_left + 170, bbox_top + 70);
draw_sprite(spr_input_keyboard_e, 0, bbox_right - 170, bbox_top + 70);

draw_set_font(global.SubHeadings);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_text(bbox_right - 220, bbox_top + 70, current_phrase_right);
draw_set_halign(fa_left);
draw_text(bbox_left + 220, bbox_top + 70, current_phrase_left);