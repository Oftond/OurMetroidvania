if (count >= 2)
{
	is_pressed = false;
	move = 0;
	count = 0;
}

if (is_pressed)
{
	move += spd * dir;
}

if (move > spd * 3 || move < -spd * 3)
{
	dir *= -1;
	count++;
}

if (device_mouse_check_button_pressed(0, mb_left) && !is_pressed && !instance_exists(obj_inventory_dark))
{
	var _touch_x = device_mouse_x(0);
    var _touch_y = device_mouse_y(0);
	if (instance_position(_touch_x, _touch_y, obj_inventory_next_page))
	{
		is_pressed = true;
		obj_inventory_targetChoice.selected_index = 0;
		obj_inventory_targetChoice.page++;
		
		if (obj_inventory_targetChoice.page > obj_inventory_targetChoice.max_pages)
			obj_inventory_targetChoice.page = 0;
			
		if (!instance_exists(obj_inventory_dark))
		{
			with (instance_create_depth(obj_inventory.x, obj_inventory.y, -99999, obj_inventory_dark))
			{
				image_xscale = obj_inventory.image_xscale;
				image_yscale = obj_inventory.image_yscale;
			}
		}
	}
}