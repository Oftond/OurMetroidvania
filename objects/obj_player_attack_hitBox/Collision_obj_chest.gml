other.is_open = true;
if (!instance_exists(obj_player_hit_impact_effect))
	instance_create_layer(x + (68 * sign(image_xscale)), y - 50, "Effects", obj_player_hit_impact_effect);