if (is_open && image_index == 0)
{
	image_speed = 1;
	mask_index = spr_chest_maskCollide;
}

if (!item_is_given && is_open && image_index >= 3)
{
	give_item();
	item_is_given = true;
}