if (hp <= 0)
{
	instance_destroy(self);
	exit;
}

if (wait_to_attack > 0)
	wait_to_attack--;
	
if (flashing > 0)
{
	flashing--;
	if (flashing % 12 > 6)
		image_alpha = 0.5;
	else
		image_alpha = 1;
}

switch(state)
{
	case STATES.IDLE:
		if (sprite_index != spr_enemy)
		{
			image_index = 0;
			sprite_index = spr_enemy;
		}
	break;
	
	case STATES.ATTACK:
		if (sprite_index != spr_enemy_attack)
		{
			image_index = 0;
			sprite_index = spr_enemy_attack;
		}
		if (image_index >= image_number - 1)
		{
			state = STATES.IDLE;
		}
		
	break;
}