damage = 1;
hp = 10;
flashing = 0;
max_flash = 30;

get_damage = function(_damage)
{
	if (flashing <= 0)
	{
		hp -= _damage;
		flashing = max_flash;
	}
}