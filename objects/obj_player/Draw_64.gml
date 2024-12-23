var _current_hp = current_hp;
for (var i = 0; i < max_hp; i++)
{
	if (_current_hp > 0)
		draw_sprite(spr_player_hp_full, 0, 100 + (sprite_get_width(spr_player_hp_full)) + (70 * i), 100);
	else
		draw_sprite(spr_player_hp_empty, 0, 100 + (sprite_get_width(spr_player_hp_empty)) + (70 * i), 100);
	_current_hp--;
}

if (is_death)
	death();