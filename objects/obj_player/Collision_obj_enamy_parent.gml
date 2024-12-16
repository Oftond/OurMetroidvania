if (flashing > 0)
	exit;
if (state != STATES.ATTACK)
{
	get_damage(other);
}
else if (state == STATES.ATTACK)
{
	other.get_damage(sword.damage);
}