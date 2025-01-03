event_inherited();

max_hp = 500;
current_hp = max_hp;
attack=spr_Ogre_Attack;
idle=spr_Ogre_idle;
move=spr_Ogre_move;
jump=spr_Ogre_idle;
fall=spr_Ogre_idle;
death=spr_death2;
attack_mask=spr_Ogre_Attack_Mask;

Move = function()
{
	if(!want_to_go)
		return;
	move_x = dir * move_speed;
	
	onGround = place_meeting(x,y+1,obj_game_manager.collision_wall);
	if(onGround)
	{
		if(move_x!=0)
		{		
			change_state(STATE.move);
		}
		else
		{
			change_state(STATE.idle)
		}
	}
	else if(move_y>=0&&can_jump)
	{
		change_state(STATE.jump)
	}
	if(move_y<0&&!onGround&&can_jump)
	{
		change_state(STATE.jump)
		move_y+=g;
	}
	else if(move_y>=0&&!onGround&&can_jump)
	{
		change_state(STATE.fall)
		move_y+=g;
	}
	var sub_pixel=0.5;
	if(place_meeting(x,move_y+y,obj_game_manager.collision_wall))
	{
		var pixel_check=sub_pixel* sign(move_y);
		while(!place_meeting(x,pixel_check+y,obj_game_manager.collision_wall))
			y+=pixel_check
		move_y=0;
	}

	if (place_meeting(x+move_x * 8,y,obj_game_manager.collision_wall) && !stop)
	{
		move_x=0;
		go_delay = timeDelay;
		stop = true;
		x -= move_x * 8;
	}
	
	if(onGround)
	{
		if(move_x!=0&&state!=STATE.attack)
		{
			change_state(STATE.move);
		}
		else if(state!=STATE.attack && onGround)
		{
			change_state(STATE.idle);
		}
	}
	else if(move_y>=0&&!onGround)
	{
		change_state(STATE.fall)
	}
	else if(move_y<0&&!onGround)
	{
		change_state(STATE.jump)
	}

	y += move_y;
	x += move_x;
	
	if (place_empty(x + (move_x * 5), y + 1, obj_game_manager.collision_wall) && can_jump)
	{
		go_delay = timeDelay;
		stop = true;
		x -= move_x * 6;
	}
}
HitAttack = function()
{
	if (current_attack == undefined || state == STATE.attack)
		return;
	
	var player_distance = point_distance(x,y,obj_player.x,obj_player.y);
	if (player_distance > current_attack.distance_to_attack)
	{
		want_to_go = true;
		Move();
		if (sign(obj_player.x - x) != 0)
			dir = sign(obj_player.x - x);
	}
	else
	{
		change_state(STATE.attack);
		want_to_go = false;
	}
}

Moves=[{name:"walk",animation:move,move_method:Move}];

Attacks=[{name:"hit",damage:2000000,animation:attack, distance_to_attack:(sprite_width / 2) + 20, attack_hitbox:attack_mask, attack_method:HitAttack}];
