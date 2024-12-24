var _current_hp = obj_player.current_hp;
for (var i = 0; i < obj_player.max_hp; i++)
{
	if (_current_hp > 0)
		draw_sprite(spr_player_hp_full, 0, camera_get_view_x(view_camera[0]) + (sprite_get_width(spr_player_hp_full)) + (70 * i), camera_get_view_y(view_camera[0]) + 10 + sprite_get_height(spr_player_hp_empty));
	else
		draw_sprite(spr_player_hp_empty, 0, camera_get_view_x(view_camera[0]) + (sprite_get_width(spr_player_hp_empty)) + (70 * i), camera_get_view_y(view_camera[0]) + 10 + sprite_get_height(spr_player_hp_empty));
	_current_hp--;
}

var _current_mana = obj_player.current_mana;
var _y_offset = 20 + sprite_get_height(spr_player_hp_full);
for (var i = 0; i < obj_player.max_mana; i++)
{
	if (_current_mana > 0)
		draw_sprite(spr_player_mana_full, 0, camera_get_view_x(view_camera[0]) + (sprite_get_width(spr_player_mana_full)) + (70 * i), camera_get_view_y(view_camera[0]) + _y_offset + sprite_get_height(spr_player_hp_empty));
	else
		draw_sprite(spr_player_mana_empty, 0, camera_get_view_x(view_camera[0]) + (sprite_get_width(spr_player_hp_empty)) + (70 * i), camera_get_view_y(view_camera[0]) + _y_offset + sprite_get_height(spr_player_mana_empty));
	_current_mana--;
}