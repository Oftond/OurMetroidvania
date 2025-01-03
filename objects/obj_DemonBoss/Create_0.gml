/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();
max_hp = 5000;
current_hp = max_hp;
can_jump=false;
attack=spr_DemonBoss_Attack_Mask;
idle=spr_DemonBoss_idle;
move=spr_DemonBoss_idle;
jump=spr_DemonBoss_idle;
fall=spr_DemonBoss_idle;
death=spr_death2;

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
Attacks=[{name:"hit",damage:99,animation:attack}];