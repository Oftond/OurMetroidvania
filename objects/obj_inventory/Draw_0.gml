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