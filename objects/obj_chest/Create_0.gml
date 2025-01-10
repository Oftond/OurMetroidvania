image_speed = 0;
is_open = false;

item = undefined;
type_item = TYPESITEMS.AMULET;
item_is_given = false;

give_item = function()
{
	with (instance_create_layer(x - 5, y, "Environment", obj_item))
	{
		type_item = other.type_item;
		item = other.item;
		chest = other;
	}
}

mask_index = sprite_index;

with (instance_create_layer(x, y, "Environment", obj_chest_roof))
{
	chest = other;
}