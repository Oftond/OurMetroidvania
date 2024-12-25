if(is_death)
{
	state = STATE.death;
	exit;
}

if (state == STATE.hit)
	exit;

if(want_to_jump&&can_jump)
{
	move_y=-jump_speed;
	want_to_jump=false
}

if (x < sprite_get_width(sprite_index) || x > room_width - sprite_get_width(sprite_index))
	dir *= -1;

move_x = dir*move_speed;
onGround=place_meeting(x,y+1,obj_game_manager.collision_wall)
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

if (place_meeting(x+move_x,y,obj_game_manager.collision_wall))
{
	var pixel_check=sub_pixel* sign(move_x);
	while(!place_meeting(x+pixel_check,y,obj_game_manager.collision_wall))
		x+=pixel_check
	move_x=0;
	dir*=-1;
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
if (instance_exists(obj_player))
{
	var player=point_distance(x,y,obj_player.x,obj_player.y);
	if(player<=detection && !playerDetected)
	{
		playerDetected=true;
		
	}
}

if(!want_to_go)
	move_x = 0;

y+=move_y;
x+=move_x;