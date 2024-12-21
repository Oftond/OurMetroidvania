var _interaction = keyboard_check_pressed(vk_up);

if (_interaction)
{
	instance_destroy(other)
	if (other.state == STATESITEMS.AMULET)
	{
		inventory.add_amulet(other.item);
	}
}