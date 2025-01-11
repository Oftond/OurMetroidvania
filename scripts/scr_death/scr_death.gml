function set_death()
{
	static alpha_dark = 0;
	static await = 0;
	static await_to_restart = 0;
	static is_saved = false;
	var max_await = 40;
	
	if (!is_saved)
	{
		obj_player.moneys = 0;
		global.SaveSystemManager.Save();
		is_saved = true;
	}
	if (alpha_dark < 1 && await >= max_await)
		alpha_dark += 0.02;
	else if (await < max_await)
		await++;
	else if (await_to_restart < max_await)
		await_to_restart++;
	else if (await_to_restart >= max_await)
	{
		alpha_dark = 0;
		await = 0;
		await_to_restart = 0;
		is_saved = false;
		global.SaveSystemManager.Load();
	}
	
	draw_sprite_ext(spr_dark, 0, 0, 0, global.CameraWidth, global.CameraHeight, 0, c_black, alpha_dark);
}