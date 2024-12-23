damage = 1;
hp = 10;
flashing = 0;
max_flash = 15;
wait_to_attack = 0;
wait_time = 30;

state = STATES.IDLE;

get_damage = function(_damage)
{
	if (flashing <= 0)
	{
		hp -= _damage;
		flashing = max_flash;
	}
}

image_xscale = -image_xscale;