if (wait_health_timer > 0)
	wait_health_timer--;
	
if (wait_mana_timer > 0)
	wait_mana_timer--;

var bar_x_pos = camera_get_view_x(view_camera[0]) + 32;
var bar_y_pos = camera_get_view_y(view_camera[0]) + 32;

var _hp = obj_player.current_hp;
var _max_hp = obj_player.max_hp;
var _bar_width = _max_hp * healthbar_width / 100;

var _mana = obj_player.current_mana;
var _max_mana = obj_player.max_mana;
var _mana_bar_width = _max_mana * manabar_width / 100;

var _offset_mana = healthbar_height + 16;

if (health_marker > _hp && wait_health_timer <= 0)
	health_marker--;
if (health_marker < _hp)
	health_marker = _hp;
	
if (mana_marker > _mana && wait_mana_timer <= 0)
	mana_marker--;
if (mana_marker < _mana)
	mana_marker = _mana;

draw_sprite_stretched(sprite_mana_back, 0, bar_x_pos, bar_y_pos + _offset_mana, _mana_bar_width, sprite_get_height(sprite_mana_back));
draw_sprite_stretched(sprite_mana_blue, 0, bar_x_pos + offset_mana_x_pos, bar_y_pos + offset_mana_y_pos + _offset_mana, (mana_marker / _max_mana) * (_mana_bar_width - offset_mana_x_pos * 2), manabar_height);
draw_sprite_stretched(sprite_mana, 0, bar_x_pos + offset_mana_x_pos, bar_y_pos + offset_mana_y_pos + _offset_mana, (_mana / _max_mana) * (_mana_bar_width - offset_mana_x_pos * 2), manabar_height);
draw_sprite_stretched(sprite_mana_bar, 0, bar_x_pos, bar_y_pos + _offset_mana, _mana_bar_width, sprite_get_height(sprite_mana_bar));

draw_sprite_stretched(sprite_back, 0, bar_x_pos, bar_y_pos, _bar_width, sprite_get_height(sprite_back));
draw_sprite_stretched(sprite_health_orange, 0, bar_x_pos + offset_x_pos, bar_y_pos + offset_y_pos, (health_marker / _max_hp) * (_bar_width - offset_x_pos * 2), healthbar_height);
draw_sprite_stretched(sprite_health, 0, bar_x_pos + offset_x_pos, bar_y_pos + offset_y_pos, (_hp / _max_hp) * (_bar_width - offset_x_pos * 2), healthbar_height);
draw_sprite_stretched(sprite_bar, 0, bar_x_pos, bar_y_pos, _bar_width, sprite_get_height(sprite_bar));