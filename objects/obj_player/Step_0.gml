mask_index = spr_player_idle;

if (is_death)
{
	sprite_index = spr_player_death;
	exit;
}

if (experience >= exp_to_level)
{
	experience -= exp_to_level;
	current_level++;
	exp_to_level = exp_to_level * (current_level + 1);
}

if (wait_to_attack > 0)
	wait_to_attack--;

var _dir = keyboard_check(vk_right) - keyboard_check(vk_left);
var _jump_key_pressed = keyboard_check_pressed(ord("Z"));
var _jump_key_hold = keyboard_check(ord("Z"));
var _attack = keyboard_check_pressed(ord("X"));
var _dash = keyboard_check_pressed(ord("C"));
var _heal = keyboard_check_pressed(ord("A"));
is_graunded = (place_meeting(x, y + 1, obj_game_manager.collision_tilemap));
on_wall = place_meeting(x - 1, y, obj_game_manager.collision_tilemap) - place_meeting(x + 1, y, obj_game_manager.collision_tilemap);
move_locked_time = max(move_locked_time - 1, 0);

if (!is_knockback)
{
	if (_attack && wait_to_attack <= 0)
	{
		if (image_index >= image_number - 3 && combo > 0 && combo < max_combo && !do_attack)
		{
			combo = clamp(combo + 1, 1, max_combo);
			do_attack = _attack;
		}
		else if (combo == 0)
			combo = clamp(combo + 1, 1, max_combo);
		state = STATES.ATTACK;
	}
	if (is_graunded)
	{
		current_jumps = 0;
		if (move_x != 0 && _dir != 0 && state != STATES.ATTACK)
			state = STATES.WALK;
		else if (state != STATES.ATTACK)
			state = STATES.IDLE;
	}
	else if (move_y >= 0 && on_wall != 0)
	{
		current_jumps = 0;
		if (state != STATES.ATTACK)
			state = STATES.WALL_JUMP;
	}
	else
	{
		if (current_jumps == 0)
			current_jumps = 1;
	}
	
	if (move_locked_time <= 0)
	{
		if (_dir != 0)
			image_xscale = sign(_dir);
		move_x = _dir * move_spd;
		
		if (_jump_key_pressed && current_jumps < max_jumps)
		{
			current_jumps++;
			jump_timer = jump_hold_time;
			if (!is_graunded && state != STATES.ATTACK)
			{
				state = STATES.DOUBLE_JUMP;
				image_index = 0;
			}
			if (on_wall != 0 && !is_graunded && move_y >= 0)
			{
				move_x = on_wall * move_wall_spd;
				move_locked_time = move_locked_max_time;
				if (state != STATES.ATTACK)
					state = STATES.JUMP;
			}
		}
	}
	
	if (!_jump_key_hold)
		jump_timer = 0;
		
	if (jump_timer > 0)
	{
		move_y = -round((jump_spd / max(current_jumps, 1)));
		jump_timer--;
	}
}

if (move_y < 0 && !is_graunded)
{
	if (!is_knockback && state != STATES.DOUBLE_JUMP && state != STATES.ATTACK)
		state = STATES.JUMP;
	if (on_wall != 0)
		move_y = min(move_y + 1, 3);
	else
		move_y += grav;
}
else if (move_y >= 0 && !is_graunded)
{
	if (!is_knockback)
	{
		if (on_wall == 0 && state != STATES.ATTACK)
			state = STATES.FALL;
	}
	if (on_wall != 0)
	{
		move_y = min(move_y + 1, 3);
		image_xscale = sign(-on_wall);
	}
	else
	{
		move_y += grav;
	}
}

var _sub_pixel = 0.5;
if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
		x += _pixel_check;
	move_x = 0;
}

if (place_meeting(x, y + move_y, obj_game_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
		y += _pixel_check;
	move_y = 0;
	jump_timer = 0;
}

if (state == STATES.ATTACK && combo < max_combo)
	move_x = 2 * _dir;
else if (state == STATES.ATTACK && combo >= max_combo)
	move_x = 0;

x += move_x;
y += move_y;

if (sprite_index == sprite_attack_1)
{
	mask_index = spr_player_maskcollide_attack_1;
}
else if (sprite_index == sprite_attack_2)
{
	mask_index = spr_player_maskcollide_attack_2;
}
else if (sprite_index == sprite_attack_3)
{
	mask_index = spr_player_maskcollide_attack_3;
}

event_inherited();