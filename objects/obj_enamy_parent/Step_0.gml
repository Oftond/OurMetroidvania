if (hp <= 0)
{
	instance_destroy(self);
	exit;
}
	
if (flashing > 0)
{
	flashing--;
	if (flashing % 12 > 6)
		image_alpha = 0.5;
	else
		image_alpha = 1;
}