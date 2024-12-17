if (other.state == STATES.ATTACK)
{
	obj_player.change_state(STATES.PARRY);
}
if (!obj_player.inventory_is_open)
	obj_player.attack(other);