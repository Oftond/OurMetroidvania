offset_x_pos = 12;
offset_y_pos = 12;

offset_mana_x_pos = 8;
offset_mana_y_pos = 8;

sprite_back = spr_player_hp_back;
sprite_health = spr_player_hp;
sprite_health_orange = spr_player_hp_orange;
sprite_bar = spr_player_hp_border;

sprite_mana_back = spr_player_mana_back;
sprite_mana_blue = spr_player_mana_blue;
sprite_mana = spr_player_mana;
sprite_mana_bar = spr_player_mana_border;

healthbar_width = sprite_get_width(sprite_bar);
healthbar_height = sprite_get_height(sprite_health);

manabar_width = sprite_get_width(sprite_mana_bar);
manabar_height = sprite_get_height(sprite_mana);

wait_health_timer = 0;
wait_mana_timer = 0;
health_marker = 0;
mana_marker = 0;