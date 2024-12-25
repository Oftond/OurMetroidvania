if (obj_player.state == STATES.HIT || obj_player.is_death)
	instance_destroy(self);

if (!obj_player.inventory_is_open && other.state != STATE.hit && obj_player.state != STATES.HIT && !obj_player.is_death)
	obj_player.attack(other);