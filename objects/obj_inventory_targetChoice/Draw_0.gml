if (page != max_pages)
{
	draw_sprite(sprite_leftTop, 0, x - distance_x - move_x, y - distance_y - move_y);
	draw_sprite(sprite_rightTop, 0, x + distance_x + move_x, y - distance_y - move_y);
	draw_sprite(sprite_rightBottom, 0, x + distance_x + move_x, y + distance_y + move_y);
	draw_sprite(sprite_leftBottom, 0, x - distance_x - move_x, y + distance_y + move_y);
}

if (choice_amulet != undefined && page == 0)
	obj_inventory.show_info_item(choice_amulet);
else if (choice_spell != undefined && page == 1)
	obj_inventory.show_info_spell(choice_spell);
	
draw_set_font(global.Tips);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

if (page == 0 && choice_amulet != undefined)
{
	if (obj_player.inventory.amulets[selected_index].is_equipped)
	{
		draw_sprite(spr_input_keyboard_enter, 0, obj_inventory.x + 20 + (sprite_get_width(spr_input_keyboard_right) * 2), obj_inventory.bbox_bottom - 95);
		draw_text(obj_inventory.x + 50 + sprite_get_width(spr_input_keyboard_enter), obj_inventory.bbox_bottom - 80, "- СНЯТЬ");
	}
	else
	{
		draw_sprite(spr_input_keyboard_enter, 0, obj_inventory.x + 20 + (sprite_get_width(spr_input_keyboard_right) * 2), obj_inventory.bbox_bottom - 95);
		draw_text(obj_inventory.x + 50 + sprite_get_width(spr_input_keyboard_enter), obj_inventory.bbox_bottom - 80, "- НАДЕТЬ");
	}
}
else if (page == 1 && choice_spell != undefined)
{
	if (obj_player.spells.spells[selected_index].is_equipped)
	{
		draw_sprite(spr_input_keyboard_enter, 0, obj_inventory.x + 20 + (sprite_get_width(spr_input_keyboard_right) * 2), obj_inventory.bbox_bottom - 95);
		draw_text(obj_inventory.x + 50 + sprite_get_width(spr_input_keyboard_enter), obj_inventory.bbox_bottom - 80, "- СНЯТЬ");
	}
	else
	{
		draw_sprite(spr_input_keyboard_enter, 0, obj_inventory.x + 20 + (sprite_get_width(spr_input_keyboard_right) * 2), obj_inventory.bbox_bottom - 95);
		draw_text(obj_inventory.x + 50 + sprite_get_width(spr_input_keyboard_enter), obj_inventory.bbox_bottom - 80, "- НАДЕТЬ");
	}
}