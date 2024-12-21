var _row = floor(selected_index / obj_inventory.max_in_row);
var _col = selected_index mod obj_inventory.max_in_row;

y = (obj_inventory.y + (obj_inventory.distance * 3)) + (_row - ((obj_inventory.count_equipment / obj_inventory.max_in_row) - 1) / 2) * (sprite_get_width(spr_inventory_player_equip) + (obj_inventory.distance * 3));
x = obj_inventory.x + (_col - (obj_inventory.max_in_row - 1) / 2) * ((sprite_get_width(spr_inventory_player_equip) * 2) + obj_inventory.distance);

draw_sprite(sprite_leftTop, 0, x - distance_x - move_x, y - distance_y - move_y);
draw_sprite(sprite_rightTop, 0, x + distance_x + move_x, y - distance_y - move_y);
draw_sprite(sprite_rightBottom, 0, x + distance_x + move_x, y + distance_y + move_y);
draw_sprite(sprite_leftBottom, 0, x - distance_x - move_x, y + distance_y + move_y);

if (delay_to_move <= 0)
{
	move_x += 1 * dir;
	move_y += 1 * dir;
}

if (((move_x < -length && move_y < -length) || (move_x > length && move_y > length)) && delay_to_move <= 0)
{
	dir *= -1;
	delay_to_move = delay_time;
}

if (delay_to_move > 0)
	delay_to_move--;

if (choice_amulet != undefined)
	obj_inventory.show_info_item(choice_amulet);