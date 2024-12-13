event_inherited();

switch (state)
{
	case STATES.IDLE:
		sprite_index = spr_player_idle;
		image_speed = 1;
	break;
	
	case STATES.JUMP:
		sprite_index = spr_player_jump;
		image_speed = 1;
	break;
	
	case STATES.DOUBLE_JUMP:
		sprite_index = spr_player_doubleJump;
		image_speed = 1;
		if (image_index == sprite_get_number(sprite_index) - 1)
			state = STATES.JUMP;
	break;
	
	case STATES.FALL:
		sprite_index = spr_player_fall;
		image_speed = 1;
	break;
	
	case STATES.WALK:
		sprite_index = spr_player_run;
		image_speed = 1;
	break;
	
	case STATES.WALL_JUMP:
		sprite_index = spr_player_wallJump;
		image_speed = 1;
	break;
	
	case STATES.HIT:
		sprite_index = sprite_hit;
		if (image_index == sprite_get_number(sprite_index) - 1)
		{
			image_speed = 0;
		}
	break;
}