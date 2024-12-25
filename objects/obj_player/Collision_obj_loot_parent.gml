if (other.type == LOOTTYPES.COIN)
{
	get_moneys(other.loot);
	instance_destroy(other);
}
else if (other.type == LOOTTYPES.MANA)
{
	instance_destroy(other);
	get_mana(other.loot);
}
else
	instance_destroy(other);