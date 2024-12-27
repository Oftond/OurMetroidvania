event_inherited();

restrictMovement();

if (state != STATE.attack)
{
	image_xscale=-sign(dir);
	if (attackDelay <= 0 && !stop)
		Rise();
}