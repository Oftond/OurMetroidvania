if (this_enemy.is_death)
	instance_destroy(self);

if(instance_exists(this_enemy))
	image_xscale=this_enemy.image_xscale;