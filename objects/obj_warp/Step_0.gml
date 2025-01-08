if (alpha >= 1 && room != room_to_go)
{
	room_goto(room_to_go);

	obj_player.x = x_set;
	obj_player.y = y_set;
}

if (alpha <= 0 && room == room_to_go)
	instance_destroy(self);