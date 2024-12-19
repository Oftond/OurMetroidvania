draw_self();
if (obj_player.inventory.is_amulet_index(obj_player.inventory.amulets, index))
{
	var _amulet = obj_player.inventory.amulets[index];
	if (!_amulet.is_equipped)
		draw_sprite(_amulet.sprite, 0, x, y);
	else
		draw_sprite_ext(_amulet.sprite, 0, x, y, 1, 1, 0, c_black, 0.5);
}