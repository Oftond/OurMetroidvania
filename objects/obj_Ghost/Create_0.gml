event_inherited();
image_speed=1;
max_hp = 500;
current_hp = max_hp;
state=STATE.apear
apear=spr_Ghost_Apear;
attack=spr_Ghost_Attack;
idle=spr_Ghost_idle;
move=spr_Ghost_Move;
death=spr_Ghost_Vanish;
fall=spr_Ghost_Move;
jump=spr_Ghost_Move;
attack_mask=spr_Ghost_Attack_mask;
can_jump=false;

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
Moves=[{name:"walk",animation:move,move_method:Move}];

Attacks=[{name:"hit",damage:10,animation:attack, distance_to_attack:sprite_width, attack_hitbox:attack_mask, attack_method:HitAttack}];