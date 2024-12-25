if (!inventory_is_open)
{
	if (flashing > 0)
		exit;
	
	get_damage(other);

	if (timer_to_dash > 0)
		timer_to_dash = 0;
	can_dash = true;
}