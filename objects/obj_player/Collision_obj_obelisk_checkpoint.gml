if (InputPressed(Input.accept))
{
	x_checkpoint = other.x_respown;
	y_checkpoint = other.y_respown;
	room_to_respawn = room;
	global.SaveSystemManager.Save();
}