if (this_enemy.state == STATE.hit)
	instance_destroy(self);

if(instance_exists(this_enemy))
	image_xscale=this_enemy.image_xscale;