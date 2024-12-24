var _interaction = keyboard_check_pressed(vk_up);

if (_interaction)
{
	instance_destroy(other)
	if (other.type_item == TYPESITEMS.AMULET)
	{
		inventory.add_amulet(other.item);
	}
}