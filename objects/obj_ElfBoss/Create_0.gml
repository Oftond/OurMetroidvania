/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();
max_hp = 5000;
current_hp = max_hp;
attack1=spr_Elf_attackArrow;
attack2=spr_Elf_attackBow1;
attack3=spr_Elf_attackBow2;
attack4=spr_Elf_attackBow3;
attack5=spr_Elf_attackBow4;
death=spr_Elf_death;
idle=spr_Elf_idle;
hit=spr_Elf_hit;
move=spr_Elf_move;
jump=spr_Elf_jump;
fall=spr_Elf_fall;
defence=spr_Elf_defence;
dash=spr_Elf_dash;
slide=spr_Elf_slide;

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
Moves=[{name:"walk",animation:move,move_method:Move}];

Attacks=[
{name:"arrow attack",damage:1,animation:attack1},
{name:"bow attack",damage:1,animation:attack2},
{name:"bow attack",damage:1,animation:attack3},
{name:"bow attack",damage:1,animation:attack4},
{name:"bow attack",damage:1,animation:attack5}];