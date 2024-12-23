if (page != max_pages)
{
	draw_sprite(sprite_leftTop, 0, x - distance_x - move_x, y - distance_y - move_y);
	draw_sprite(sprite_rightTop, 0, x + distance_x + move_x, y - distance_y - move_y);
	draw_sprite(sprite_rightBottom, 0, x + distance_x + move_x, y + distance_y + move_y);
	draw_sprite(sprite_leftBottom, 0, x - distance_x - move_x, y + distance_y + move_y);
}

if (choice_amulet != undefined && page == 0)
	obj_inventory.show_info_item(choice_amulet);