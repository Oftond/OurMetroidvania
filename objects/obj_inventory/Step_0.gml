if (obj_player.inventory_id != undefined)
	inventory_is_end_moving = layer_sequence_is_finished(obj_player.inventory_id);

if (inventory_is_end_moving && layer_sequence_get_headdir(obj_player.inventory_id) == seqdir_left)
{
	layer_sequence_destroy(obj_player.inventory_id);
	obj_player.inventory_id = undefined;
}