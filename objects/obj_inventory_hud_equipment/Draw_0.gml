draw_self();
if (obj_player.inventory.is_amulet_index(index))
{
	var _amulet = obj_player.inventory.amulets[index];
	draw_sprite(_amulet.sprite, 0, x, y);
}