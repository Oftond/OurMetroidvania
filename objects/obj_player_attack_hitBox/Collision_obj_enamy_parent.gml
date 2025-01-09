if (obj_player.state == STATES.HIT || obj_player.is_death)
{
	instance_destroy(self);
	exit;
}

if (other.flashing > 0)
	exit;

if (!obj_player.inventory_is_open  && obj_player.state != STATES.HIT && !obj_player.is_death)
{
	obj_player.attack(other);
	other.flashing = 10;
	if (!instance_exists(obj_player_hit_impact_effect))
		instance_create_layer(x + (68 * sign(image_xscale)), y - 50, "Effects", obj_player_hit_impact_effect);
}