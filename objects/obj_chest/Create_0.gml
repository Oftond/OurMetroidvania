image_speed = 0;
is_open = false;

item = undefined;
type_item = TYPESITEMS.AMULET;

give_item = function()
{
	with (instance_create_layer(x, y, "Environment", obj_item))
	{
		type_item = other.type_item;
		item = other.item;
	}
}