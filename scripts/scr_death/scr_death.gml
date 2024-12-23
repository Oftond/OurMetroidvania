function death()
{
	static alpha_dark = 0;
	static await = 0;
	static await_to_restart = 0;
	var max_await = 40;
	
	if (alpha_dark < 1 && await >= max_await)
		alpha_dark += 0.02;
	else if (await < max_await)
		await++;
	else if (await_to_restart < max_await)
		await_to_restart++;
	else if (await_to_restart >= max_await)
		room_restart();
	
	draw_sprite_ext(spr_wall, 0, 0, 0, global.CameraWidth, global.CameraHeight, 0, c_black, alpha_dark);
}