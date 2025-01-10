if (global.IsPause)
	exit;
if (flashing > 0 && !is_death)
{
	flashing--;
	image_blend = c_maroon;
}
else if (image_blend != c_white)
	image_blend = c_white;

if (go_delay > 0)
{
	go_delay--;
	want_to_go = false;
	if (go_delay <= 0)
		dir *= -1;
}
else if (!want_to_go && stop)
{
	want_to_go = true;
	stop = false;
}

if(is_death)
{
	change_state(STATE.death);
	exit;
}

if (state == STATE.attack && current_attack != undefined && attackDelay <= 0)
{
	current_attack.attack_method();
	exit;
}

if (attackDelay > 0)
{
	change_state(STATE.idle);
	want_to_go = false;
	attackDelay--;
	exit;
}

if (instance_exists(obj_player) && playerDetected)
{
	var player = point_distance(x,y,obj_player.x,obj_player.y);
	if(player > detection)
	{
		playerDetected = false;
		want_to_go = true;
		chooseSelected = false;
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

//Вызывается метод передвижения
Move();

if ((x <= sprite_get_width(sprite_index) || x >= room_width - sprite_get_width(sprite_index)) && !stop)
{
	go_delay = timeDelay;
	stop = true;
}
	
if (stop)
	change_state(STATE.idle);