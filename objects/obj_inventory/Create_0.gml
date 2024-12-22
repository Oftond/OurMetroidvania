count_equip = obj_player.inventory.max_cells_amulets;
count_equipment = obj_player.inventory.max_number_amulets;
distance = 20;
distance_to_strings = 0;
max_in_row = round(count_equipment / 3);
inventory_is_end_moving = false;

phrases = ["ЭКИПИРОВКА", "ЗАКЛИНАНИЯ", "КАРТА"];

current_phrase_right = phrases[2];
current_phrase_left = phrases[1];

instance_create_depth(x, y, -9999, obj_inventory_next_page);
instance_create_depth(x, y, -9999, obj_inventory_previous_page);
instance_create_depth(x, y, -9999 ,obj_inventory_targetChoice);

show_info_item = function(_item)
{
	draw_set_font(global.SubHeadings);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_ext(bbox_right - 300, bbox_top + 200, _item.name, 50, 500);
	draw_sprite_ext(_item.sprite, 0, bbox_right - 300, bbox_top + 150 + (sprite_get_height(_item.sprite) * 2), 2, 2, 0, c_white, 1);
	draw_set_font(global.Description);
	draw_text_ext(bbox_right - 300, bbox_top + 100 + (sprite_get_height(_item.sprite) * 4), _item.description, 30, 500)
}