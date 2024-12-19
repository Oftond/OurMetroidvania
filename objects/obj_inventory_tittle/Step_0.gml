if (obj_player.inventory_id != undefined)
	inventory_is_end_moving = layer_sequence_is_finished(obj_player.inventory_id);
	
if (inventory_is_end_moving && layer_sequence_get_headdir(obj_player.inventory_id) == seqdir_right)
{
	if (instance_number(obj_inventory_hud_equip) < count_equip)
	{
		for (var i = 0; i < count_equip; i++)
		{
			var _x_pos = x + (i - (count_equip - 1) / 2) * (sprite_get_width(spr_inventory_player_equip) + distance);
			with (instance_create_depth(_x_pos, bbox_top + sprite_get_width(spr_inventory_player_equip) * 2 + 20, depth - 1, obj_inventory_hud_equip))
			{
				index = i;
			}
		}
	}
	var _index = 0;
	if (instance_number(obj_inventory_hud_equipment) < count_equipment)
	{
		for (var i = 0; i < count_equipment / max_in_row; i++)
		{
			for (var j = 0; j < max_in_row; j++)
			{	
				var _y_pos = y + (distance * 3) +(i - ((count_equipment / max_in_row) - 1) / 2) * (sprite_get_width(spr_inventory_player_equipment) + (distance * 3));
				var _x_pos = x + (j - (max_in_row - 1) / 2) * (sprite_get_width(spr_inventory_player_equipment) + distance);
				var _inst = instance_create_depth(_x_pos, _y_pos, depth - 1, obj_inventory_hud_equipment);
				_inst.index = _index;
				if (!instance_exists(obj_inventory_targetChoice))
					with(instance_create_depth(_inst.x, _inst.y, depth - 1, obj_inventory_targetChoice))
					{
						state = _inst.state;
					}
				_index++;
			}
		}
	}
}

if (inventory_is_end_moving && layer_sequence_get_headdir(obj_player.inventory_id) == seqdir_left)
{
	layer_sequence_destroy(obj_player.inventory_id);
	obj_player.inventory_id = undefined;
}