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

var _accept_icon = GetHint(Input.accept);
var _offset = sprite_get_width(_accept_icon) + 50;
if (page == 0 && choice_amulet != undefined)
{
	draw_sprite(_accept_icon, 0, obj_inventory.x + 20 + _offset, obj_inventory.bbox_bottom - 95);
	if (obj_player.inventory.amulets[selected_index].is_equipped)
		draw_text(obj_inventory.x + _offset * 2, obj_inventory.bbox_bottom - 80, "снять");
	else
		draw_text(obj_inventory.x + _offset * 2, obj_inventory.bbox_bottom - 80, "надеть");
}
else if (page == 1 && choice_spell != undefined)
{
	draw_sprite(_accept_icon, 0, obj_inventory.x + 20 + _offset, obj_inventory.bbox_bottom - 95);
	if (obj_player.spells.spells[selected_index].is_equipped)
		draw_text(obj_inventory.x + _offset * 2, obj_inventory.bbox_bottom - 80, "снять");
	else
		draw_text(obj_inventory.x + _offset * 2, obj_inventory.bbox_bottom - 80, "надеть");
}