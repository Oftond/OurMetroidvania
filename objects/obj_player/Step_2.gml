event_inherited();

switch (state)
{
	case STATES.IDLE:
		if (sprite_index != sprite_idle)
		{
			image_index = 0;
			sprite_index = sprite_idle;
		}
		image_speed = 1;
	break;
	
	case STATES.JUMP:
		if (sprite_index != spr_player_jump)
		{
			image_index = 0;
			sprite_index = spr_player_jump;
		}
		image_speed = 1;
	break;
	
	case STATES.DOUBLE_JUMP:
		if (sprite_index != spr_player_doubleJump)
		{
			image_index = 0;
			sprite_index = spr_player_doubleJump;
		}
		image_speed = 1;
	break;
	
	case STATES.FALL:
		if (sprite_index != spr_player_fall)
		{
			image_index = 0;
			sprite_index = spr_player_fall;
		}
		image_speed = 1;
	break;
	
	case STATES.WALK:
		if (sprite_index != spr_player_run)
		{
			image_index = 0;
			sprite_index = spr_player_run;
		}
		image_speed = 1;
	break;
	
	case STATES.WALL_JUMP:
		if (sprite_index != spr_player_wallJump)
		{
			image_index = 0;
			sprite_index = spr_player_wallJump;
		}
		image_speed = 1;
	break;
	
	case STATES.HIT:
		if (sprite_index != sprite_hit)
		{
			image_index = 0;
			sprite_index = sprite_hit;
		}
		if (image_index == sprite_get_number(sprite_index) - 1)
		{
			image_speed = 0;
		}
	break;
	
	case STATES.DASH:
		if (sprite_index != spr_player_doubleJump)
		{
			image_index = 0;
			sprite_index = spr_player_doubleJump;
		}
		with (instance_create_depth(x, y, depth + 1, obj_player_dasTail))
		{
			sprite_index = other.sprite_index;
			image_blend = c_white;
			image_alpha = 0.5;
		}
		image_speed = 1;
	break;
	
	case STATES.ATTACK:
		if (combo == 1)
		{
			if (sprite_index != sprite_attack_1)
			{
				image_index = 0;
				sprite_index = sprite_attack_1;
				do_attack = false;
			}
		}
		image_speed = 1;
		if (image_index >= image_number - 1)
		{
			if (combo % 2 != 0 && combo != max_combo && do_attack)
			{
				if (sprite_index != sprite_attack_1)
				{
					image_index = 0;
					sprite_index = sprite_attack_1;
					do_attack = false;
					exit;
				}
			}
			else if (combo % 2 == 0 && combo != max_combo && do_attack)
			{
				if (sprite_index != sprite_attack_2)
				{
					image_index = 0;
					sprite_index = sprite_attack_2;
					do_attack = false;
					exit;
				}
			}
			else if (combo == max_combo && do_attack)
			{
				if (sprite_index != sprite_attack_3)
				{
					image_index = 0;
					sprite_index = sprite_attack_3;
					do_attack = false;
					wait_to_attack = wait_time;
					exit;
				}
			}
			if (combo >= max_combo)
				wait_to_attack = wait_time;
			if (!do_attack)
			{
				state = STATES.IDLE;
				combo = 0;
			}
		}
	break;
}