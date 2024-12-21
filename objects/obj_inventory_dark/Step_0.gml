if (delay > 0)
	delay--;

if (delay <= 0)
	image_alpha += image_black_alpha * dir;

if (image_alpha > 1)
	image_alpha = 1;
	
if (image_alpha >= 1 && delay <= 0)
{
	delay = time_delay;
	dir *= -1;
}
	
if (image_alpha <= 0)
	instance_destroy(self);