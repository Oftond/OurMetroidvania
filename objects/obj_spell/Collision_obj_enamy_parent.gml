if (other.is_death)
	exit;
if (!obj_player.inventory_is_open && damage > 0 && move_slow == 0)
{
	other.GetDamage(damage);
	if (can_destroy)
		instance_destroy(self);
}
else if (!obj_player.inventory_is_open && damage == 0 && move_slow > 0 && time_to_destroy > 0 && (x >= other.x - 10 && x <= other.x + 10))
{
	other.move_speed -= move_slow;
	if (other.move_speed < 0)
		other.move_speed = 0;
	alarm[0] = time_to_destroy;
	time_to_destroy = 0;
	speed = 0;
	touch_enemy = other;
}