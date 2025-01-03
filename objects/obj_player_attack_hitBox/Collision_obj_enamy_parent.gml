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
}