if (!inventory_is_open)
{
	if (flashing > 0 || other.this_enemy.is_death)
		exit;
	
	get_damage(other);

	if (timer_to_dash > 0)
		timer_to_dash = 0;
	can_dash = true;
}