if (flashing > 0)
	flashing--;

if (go_delay > 0)
{
	go_delay--;
	want_to_go = false;
	if (go_delay <= 0)
		dir *= -1;
}
else if (!want_to_go)
{
	want_to_go = true;
}

if(is_death)
{
	state = STATE.death;
	exit;
}

if (state == STATE.hit)
	exit;
	
if (instance_exists(obj_player) && playerDetected)
{
	var player = point_distance(x,y,obj_player.x,obj_player.y);
	if(player > detection)
	{
		playerDetected = false;
		want_to_go = true;
		chooseSelected = false;
		attackDelay = 0;
		current_attack = undefined;
	}
}
	
if (playerDetected)
{
	battleWithPlayer();
	exit;
}

if(want_to_jump&&can_jump)
{
	move_y = -jump_speed;
	want_to_jump = false
}

if (instance_exists(obj_player))
{
	var player=point_distance(x,y,obj_player.x,obj_player.y);
	if(player<=detection && !playerDetected)
	{
		playerDetected=true;
	}
}

Move();

if ((x <= sprite_get_width(sprite_index) || x >= room_width - sprite_get_width(sprite_index)) && !stop)
{
	go_delay = timeDelay;
	stop = true;
}

if (move_x > 0 && stop)
	stop = false;
	
if (stop)
	change_state(STATE.idle);