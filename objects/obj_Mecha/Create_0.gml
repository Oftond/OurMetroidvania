/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();
max_hp = 2500;
current_hp = max_hp;
attack2=spr_Mecha_attack2;
attack=spr_Mecha_attack;
attack3=spr_Mecha_attack3;
death=spr_Mecha_death;
idle=spr_Mecha_idle;
move=spr_Mecha_move;
jump=spr_Mecha_idle;
fall=spr_Mecha_idle;
defence=spr_Mecha_defence;
heal=spr_Mecha_heal;
can_jump=false;
attack_mask=spr_Mecha_attack_Mask;
attack_mask2=spr_Mecha_attack2_mask;
attack_mask3=spr_Mecha_Attack3_Mask;

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
HitAttack2 = function()
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
HitAttack3 = function()
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
Attacks=[
{name:"hit",damage:2,animation:attack, distance_to_attack:sprite_width+200, attack_hitbox:attack_mask, attack_method:HitAttack},
{name:"hit",damage:2,animation:attack2, distance_to_attack:sprite_width+2, attack_hitbox:attack_mask2, attack_method:HitAttack2},
{name:"hit",damage:2,animation:attack2, distance_to_attack:sprite_width+400, attack_hitbox:attack_mask3, attack_method:HitAttack3}];

Moves=[{name:"walk",animation:move,move_method:Move}];

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

