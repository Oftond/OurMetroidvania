//Враг готов
event_inherited();

max_hp = 8;
current_hp = max_hp;

start_pos = y;
left_far_point = 0;
right_far_point = 0;

detection = 600;
timeDelay = 120;

attack_mask = spr_DefiledGoomba_attack_mask;
attack=spr_DefiledGoomba_attack;
death=spr_DefiledGoomba_death;
idle=spr_DefiledGoomba_idle;
hit=spr_DefiledGoomba_hit;
move=spr_DefiledGoomba_move;
fall=spr_DefiledGoomba_idle;
dash=spr_DefiledGoomba_idle;
slide=spr_DefiledGoomba_idle;
jump=spr_DefiledGoomba_idle;
can_jump=false;

count_coin_drop = 2;
is_fall = false;

Move = function()
{
	if(!want_to_go)
		return;
		
	if (!stop && attackDelay <= 0)
		change_state(STATE.move);
		
	move_x = dir * move_speed;

	if (place_meeting(x+move_x,y,obj_game_manager.collision_wall) && !stop)
	{
		var pixel_check=sub_pixel* sign(move_x);
		while(!place_meeting(x+pixel_check,y,obj_game_manager.collision_wall))
			x+=pixel_check
		move_x=0;
		go_delay = timeDelay;
		stop = true;
	}

	x += move_x;
	
	if (x < left_far_point)
		x = left_far_point;
	else if (x > right_far_point)
		x = right_far_point;
	
	if ((x == left_far_point || x == right_far_point) && go_delay <= 0 && !stop)
	{
		go_delay = timeDelay;
		stop = true;
	}
}

//Метод, выполняющий всю логику конкретной атаки врага
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
	else if (state != STATE.attack && !is_fall && !stop)
	{
		want_to_go = true;
		Move();
	}
	
	if (is_fall)
		if (image_index >= 9 && sprite_index == current_attack.animation)
			Fall();
}

//Метод, позволяющий этому врагу падать на игрока сверху
Fall = function()
{
	onGround = place_meeting(x,y+1,obj_game_manager.collision_wall);
	
	if(!onGround)
		move_y += g;
	
	if(place_meeting(x,move_y + 15+y,obj_game_manager.collision_wall))
		move_y = 0;
	
	y += move_y;
}

//Метод, поднимающий этого врага после его падения
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

	y += move_y;
}
Moves=[{name:"walk",animation:move,move_method:Move}];
Attacks=[{name:"hit",damage:1,animation:attack, distance_to_attack:(sprite_width / 2) - 25, attack_hitbox:attack_mask, attack_method:HitAttack}];