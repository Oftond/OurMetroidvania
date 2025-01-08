if (!instance_exists(obj_warp))
{
	with (instance_create_layer(0, 0, "GUI", obj_warp))
	{
		room_to_go = other.room_to_go;
		x_set = other.x_set;
		y_set = other.y_set;
	}
}