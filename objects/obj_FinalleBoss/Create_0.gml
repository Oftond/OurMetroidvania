/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();
max_hp = 15000;
current_hp = max_hp;
magic_attack=spr_FinalleBoss_attackMagic;
air_attack=spr_FinalleBoss_attackAir;
attack1=spr_FinalleBoss_attackSword1;
attack2=spr_FinalleBoss_attackSword2;
attack3=spr_FinalleBoss_attackSword3
death=spr_FinalleBoss_death;
idle=spr_FinalleBoss_idle;
hit=spr_FinalleBoss_hit;
move=spr_FinalleBoss_walk;
defence=spr_FinalleBoss_defend;
jump=spr_FinalleBoss_jump;
surf=spr_FinalleBoss_surf;
heal=spr_FinalleBoss_heal
fall=spr_FinalleBoss_down;

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
{name:"magic_attack",damage:70,animation:magic_attack,attack_hitbox:spr_FinalleBoss_attackMagic_Mask},
{name:"air_attack",damage:70,animation:air_attack,attack_hitbox:spr_FinalleBoss_attackAir_Mask},
{name:"sword_attack1",damage:70,animation:attack1,attack_hitbox:spr_FinalleBoss_attackSword1_mask},
{name:"sword_attack2",damage:70,animation:attack2,attack_hitbox:spr_FinalleBoss_attackSword2_mask},
{name:"sword_attack3",damage:70,animation:attack3,attack_hitbox:spr_FinalleBoss_attackSword3_mask}];

Moves=[{name:"walk",animation:move},{name:"surf",animation:surf}];