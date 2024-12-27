event_inherited();

detection = 200;
base_damage = 1;
count_coin_drop = 1;

GetDamage = function(_damage)
{
	current_hp -= _damage;
	if(current_hp < 0)
		current_hp = 0;
}

change_state = function(_state)
{
	if(state != STATE.jump)
		state = _state;
	else if(_state == STATE.fall)
		state = _state;
}

move_x = 0;
move_y = 0;
jump_speed = 25;
g = 1;
move_speed = 2;
dir = choose(-1, 1);
onGround = true;
want_to_jump = false;
timeDelay = 60;
attackDelay = 0;
want_to_go = true;
go_delay = 0;
stop = false;
chooseSelected = false;
current_attack = undefined;

attack=spr_Batman_Attack;
death=spr_death2;
idle=spr_Batman_fly;
hit=spr_Batman_Hit;
move=spr_Batman_fly;
jump=spr_Batman_fly;
fall=spr_Batman_fly;
dash=spr_Batman_fly;
slide=spr_Batman_fly;
attack_mask = spr_Batman_Attack_Mask;
can_jump=true;
playerDetected=false;

HitAttack = function()
{
	show_message("Атакуем!")
}

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

	if (place_meeting(x+move_x,y,obj_game_manager.collision_wall) && !stop)
	{
		var pixel_check=sub_pixel* sign(move_x);
		while(!place_meeting(x+pixel_check,y,obj_game_manager.collision_wall))
			x+=pixel_check
		move_x=0;
		go_delay = timeDelay;
		stop = true;
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
}

Attacks=[{name:"hit",damage:2,animation:attack, distance_to_attack:sprite_width, attack_hitbox:attack_mask, attack_method:HitAttack}];

Moves=[{name:"walk",animation:move,move_method:Move}];

battleWithPlayer = function()
{
	if (state == STATE.attack)
		return;
	if (!chooseSelected && attackDelay <= 0)
	{
		chooseSelected = true;
		var attackChoice = irandom(array_length(Attacks) - 1);
		current_attack = Attacks[attackChoice];
		attack=current_attack.animation;
		base_damage=current_attack.damage;
		want_to_go=false;
		current_attack.attack_method();
	}
	else if (attackDelay > 0)
	{
		change_state(STATE.idle);
		want_to_go = false;
		attackDelay--;
	}
	else if (chooseSelected && attackDelay <= 0 && current_attack != undefined)
		current_attack.attack_method();
}