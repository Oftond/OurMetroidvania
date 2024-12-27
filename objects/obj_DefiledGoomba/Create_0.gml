event_inherited();

max_hp = 8;
current_hp = max_hp;

start_pos = y;
left_far_point = 0;
right_far_point = 0;

detection = 400;
timeDelay = 120;

attack_mask = spr_DefiledGoomba_attack_mask;
attack=spr_DefiledGoomba_attack;
death=spr_DefiledGoomba_death;
idle=spr_DefiledGoomba_idle;
hit=spr_DefiledGoomba_hit;
move=spr_DefiledGoomba_move;
fall=spr_DefiledGoomba_move;
dash=spr_DefiledGoomba_move;
slide=spr_DefiledGoomba_move;
jump=spr_DefiledGoomba_move;
can_jump=false;

count_coin_drop = 2;
is_fall = false;

HitAttack = function()
{
	if (current_attack == undefined)
		return;
	if (obj_player.x >= x - current_attack.distance_to_attack && obj_player.x <= x + current_attack.distance_to_attack && !is_fall)
	{
		is_fall = true;
		change_state(STATE.attack);
		want_to_go = false;
	}
	else if (state != STATE.attack && !is_fall)
	{
		want_to_go = true;
		restrictMovement();
		Move();
	}
	
	if (is_fall)
		if (image_index >= 9 && sprite_index == current_attack.animation)
			Fall();
}

Fall = function()
{
	onGround = place_meeting(x,y+1,obj_game_manager.collision_wall);
	
	if(!onGround)
		move_y += g;
	
	if(place_meeting(x,move_y + 15+y,obj_game_manager.collision_wall))
		move_y = 0;
	
	y += move_y;
}

Rise = function()
{
	if (move_y < -3)
		move_y = -3;
	if (y > start_pos)
	{
		move_y -= g;
		want_to_go = false;
	}
	else if (!want_to_go)
	{
		is_fall = false;
		move_y = 0;
		want_to_go = true;
	}
	if (y > start_pos)
		y += move_y;
}

restrictMovement = function()
{
	if ((x < left_far_point || x > right_far_point) && go_delay <= 0 && !stop)
	{
		go_delay = timeDelay;
		stop = true;
	}
}

Attacks=[{name:"hit",damage:1,animation:attack, distance_to_attack:(sprite_width / 2) - 25, attack_hitbox:attack_mask, attack_method:HitAttack}];