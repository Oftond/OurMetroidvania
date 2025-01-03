event_inherited();
max_hp = 40;
current_hp = max_hp;

move=spr_Gnom_walk;
attack1=spr_Gnom_attack;
attack2=spr_Gnom_attack2;
attack3=spr_Gnom_attack3;
attack4=spr_Gnom_attack4;
airAttack=spr_Gnom_airAttack;
attack_mask_1 = spr_Gnom_airAttack_mask;
attack_mask_2 = spr_Gnom_attack4_mask;
attack_mask_3 = spr_Gnom_attack_mask;
attack_mask_4 = spr_Gnom_attack2_mask;
attack_mask_5 = spr_Gnom_attack3_mask;
death=spr_Gnom_death;
idle=spr_Gnom_idle;
hit=spr_Gnom_hit;
defence=spr_Gnom_defence;
jump=spr_Gnom_jump;
fall=spr_Gnom_fall;
dash=spr_Gnom_dash;
can_jump=true;

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

Attacks=[
{name:"air_attack",damage:2,animation:airAttack,attack_hitbox:attack_mask_1},
{name:"hammer_attack4",damage:2,animation:attack4,attack_hitbox:attack_mask_2},
{name:"hammer_attack1",damage:2,animation:attack1,attack_hitbox:attack_mask_3},
{name:"hammer_attack2",damage:2,animation:attack2,attack_hitbox:attack_mask_4},
{name:"hammer_attack3",damage:2,animation:attack3,attack_hitbox:attack_mask_5}];
Moves=[{name:"walk",animation:move,move_method:Move}];