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

if (device_mouse_check_button_pressed(0, mb_left) && !is_pressed)
{
	var _touch_x = device_mouse_x_to_gui(0);
    var _touch_y = device_mouse_y_to_gui(0);
	if (instance_position(_touch_x, _touch_y, obj_inventory_previous_page))
	{
		is_pressed = true;
		
		obj_inventory_targetChoice.page--;
		
		if (obj_inventory_targetChoice.page < 0)
			obj_inventory_targetChoice.page = obj_inventory_targetChoice.max_pages;
	}
}