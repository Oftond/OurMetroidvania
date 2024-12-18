if (obj_player.inventory_is_open && obj_player.inventory_id != undefined)
	inventory_is_end_moving = layer_sequence_is_finished(obj_player.inventory_id);
	
if (inventory_is_end_moving && instance_number(obj_inventory_hud_equip) < count_equipment)
{
	for (var i = 0; i < count_equipment; i++)
	{
		instance_create_depth(start_pos_x_equip + (distance * i), bbox_top + sprite_get_width(spr_inventory_player_equip) * 2 + 20, depth - 1, obj_inventory_hud_equip);
	}
	
	//for (var i = 0; i < count_equip; i++)
	//{
	//	instance_create_depth(start_pos_x_equipment + (distance * i), bbox_top + sprite_get_width(spr_inventory_player_equipment) * 2 + 140, depth - 1, obj_inventory_hud_equipment);
	//}
}