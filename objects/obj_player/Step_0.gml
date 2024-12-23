if (is_death)
{
	state = STATES.DEATH;
	exit;
}

if (wait_to_attack > 0)
	wait_to_attack--;
	
if (timer_to_dash > 0)
	timer_to_dash--;
else if (timer_to_dash == 0)
	is_dashing = false;

var _dir = keyboard_check(vk_right) - keyboard_check(vk_left);
var _jump_key_pressed = keyboard_check_pressed(ord("Z"));
var _jump_key_hold = keyboard_check(ord("Z"));
var _attack = keyboard_check_pressed(ord("X"));
var _dash = keyboard_check_pressed(ord("C"));
var _open_inventory = keyboard_check_pressed(vk_tab)
var _spell_a = keyboard_check_pressed(ord("A"));
var _spell_b = keyboard_check_pressed(ord("S"));
var _spell_c = keyboard_check_pressed(ord("D"));
is_graunded = place_meeting(x, y + 1, obj_game_manager.collision_wall) || place_meeting(x, y + 1, obj_obstacles);
on_wall = place_meeting(x - 1, y, obj_game_manager.collision_wall) - place_meeting(x + 1, y, obj_game_manager.collision_wall);
move_locked_time = max(move_locked_time - 1, 0);

if (_open_inventory && !is_dashing && is_graunded)
{
	if (!inventory_is_open && inventory_id == undefined)
	{
		inventory_is_open = true;
		change_state(STATES.IDLE);
	}
	else if (inventory_is_open && inventory_id != undefined)
	{
		if (layer_sequence_is_finished(inventory_id))
			inventory_is_open = false;
	}
	if (inventory_is_open && inventory_id == undefined)
		inventory_id = layer_sequence_create("GUI", camera_get_view_x(view_camera[0]) + global.CameraWidth / 2, camera_get_view_y(view_camera[0]) + global.CameraHeight / 2, seq_inventory_open);
	else if (!inventory_is_open && inventory_id != undefined)
	{
		if (layer_sequence_get_headdir(inventory_id) != seqdir_left)
		{
			layer_sequence_headdir(inventory_id, seqdir_left);
			layer_sequence_play(inventory_id)
		}
	}
}

if (!inventory_is_open)
{
	if (spell_delay > 0)
		spell_delay--;
	
	if (!is_knockback)
	{
		if (_spell_a && state != STATES.ATTACK && state != STATES.CAST_SPELL)
		{
			if (spells.equip_spells[0] != undefined)
			{
				change_state(STATES.CAST_SPELL);
				current_spel_cast = spells.equip_spells[0];
			}
		}
		else if (_spell_b && state != STATES.ATTACK && state != STATES.CAST_SPELL) 
		{
			if (spells.equip_spells[1] != undefined)
			{
				change_state(STATES.CAST_SPELL);
				current_spel_cast = spells.equip_spells[1];
			}
		}
		else if (_spell_c && state != STATES.ATTACK && state != STATES.CAST_SPELL)
		{
			if (spells.equip_spells[2] != undefined)
			{
				change_state(STATES.CAST_SPELL);
				current_spel_cast = spells.equip_spells[2];
			}
		}
		
		if (_dash && timer_to_dash <= 0 && !is_dashing && can_dash)
		{
			timer_to_dash = time_dash;
			is_dashing = true;
			can_dash = false;
			change_state(STATES.DASH);
			if (!is_graunded && on_wall != 0)
			{
				image_xscale *= -1;
				move_x = (dash_spd * sign(image_xscale));
			}
			else
				move_x = (dash_spd * sign(image_xscale));
		}
		
		if (_attack && wait_to_attack <= 0)
		{
			if (image_index >= image_number - 3 && combo > 0 && combo < max_combo && !do_attack)
			{
				combo = clamp(combo + 1, 1, max_combo);
				do_attack = _attack;
			}
			else if (combo == 0)
				combo = clamp(combo + 1, 1, max_combo);
			change_state(STATES.ATTACK);
		}
		if (is_graunded)
		{
			can_dash = true;
			current_jumps = 0;
			if (move_x != 0 && _dir != 0)
				change_state(STATES.WALK);
			else
				change_state(STATES.IDLE);
		}
		else if (move_y >= 0 && on_wall != 0)
		{
			current_jumps = 0;
			change_state(STATES.WALL_JUMP);
		}
		else
		{
			if (current_jumps == 0)
				current_jumps = 1;
		}
	
		if (move_locked_time <= 0 && !is_dashing)
		{
			if (_dir != 0)
				image_xscale = sign(_dir);
			move_x = _dir * move_spd;
		
			if (_jump_key_pressed && current_jumps < max_jumps)
			{
				current_jumps++;
				jump_timer = jump_hold_time;
				if (!is_graunded)
				{
					change_state(STATES.DOUBLE_JUMP);
					image_index = 0;
				}
				if (on_wall != 0 && !is_graunded && move_y >= 0)
				{
					move_x = on_wall * move_wall_spd;
					move_locked_time = move_locked_max_time;
					change_state(STATES.JUMP);
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

	if (on_wall != 0)
		can_dash = true;

	if (is_dashing || state == STATES.CAST_SPELL)
		move_y = 0;
		
	if (state == STATES.CAST_SPELL)
		move_x = 0;
	
	else if (move_y < 0 && !is_graunded)
	{
		if (!is_knockback && state != STATES.DOUBLE_JUMP)
			change_state(STATES.JUMP);
		if (on_wall != 0)
		{
			move_y = min(move_y + 1, 3);
		}
		else
			move_y += grav;
	}
	else if (move_y >= 0 && !is_graunded)
	{
		if (!is_knockback)
		{
			if (on_wall == 0)
				change_state(STATES.FALL);
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

	if (state == STATES.ATTACK && combo < max_combo)
		move_x = 2 * _dir;
	else if (state == STATES.ATTACK && combo >= max_combo)
		move_x = 0;

	var _sub_pixel = 0.5;
	if (place_meeting(x + move_x, y, obj_game_manager.collision_wall))
	{
		var _pixel_check = _sub_pixel * sign(move_x);
		while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_wall))
			x += _pixel_check;
		move_x = 0;
	}

	if (place_meeting(x, y + move_y, obj_game_manager.collision_wall))
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_wall))
			y += _pixel_check;
		move_y = 0;
		jump_timer = 0;
	}
	
	if (place_meeting(x + move_x, y, obj_obstacles))
	{
		var _pixel_check = _sub_pixel * sign(move_x);
		while (!place_meeting(x + _pixel_check, y, obj_obstacles))
			x += _pixel_check;
		move_x = 0;
	}

	if (place_meeting(x, y + move_y, obj_obstacles))
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_obstacles))
			y += _pixel_check;
		move_y = 0;
		jump_timer = 0;
	}
	
	if (move_y > 15)
		move_y = 15;

	x += move_x;
	y += move_y;
}

event_inherited();