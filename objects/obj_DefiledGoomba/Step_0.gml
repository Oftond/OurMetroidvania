event_inherited();

if (state != STATE.attack)
{
	image_xscale=-sign(dir);
	if (attackDelay <= 0 && !stop && y > start_pos)
		Rise();
	else if (!stop && attackDelay <= 0)
	{
		want_to_go = true;
		move_y = 0;
		is_fall = false;
	}
}