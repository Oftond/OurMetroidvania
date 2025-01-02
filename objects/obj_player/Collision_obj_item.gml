if (InputPressed(Input.up) || InputStickVerticalPressed() <= -ValueGamepadPressed)
{
	instance_destroy(other)
	if (other.type_item == TYPESITEMS.AMULET)
		inventory.add_amulet(other.item);
	else if (other.type_item == TYPESITEMS.SPELL)
		spells.add_spell(other.item);
}