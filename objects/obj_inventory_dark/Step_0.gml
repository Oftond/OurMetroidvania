image_alpha -= image_black_alpha
	
if (image_alpha <= 0)
	instance_destroy(self);