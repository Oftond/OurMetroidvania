if (obj_inventory_previous_page.is_pressed || obj_inventory_next_page.is_pressed)
{
	if (!instance_exists(obj_inventory_dark))
	{
		with (instance_create_depth(x, y, -99999, obj_inventory_dark))
		{
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}
	}
}