event_inherited();

max_hp = 250;
current_hp = max_hp;
max_mana = 175;
current_mana = max_mana;
moneys = 0;

do_dash = false;
do_climbing = false;
max_jumps = 1;

min_increase_hp = 5;
min_increase_mana = 5;
grav = 1;
current_jumps = 0;
inventory_is_open = false;
inventory_id = undefined;
is_dashing = false;
timer_to_dash = 0;
time_dash = 15;
can_dash = true;
dash_spd = 25;
do_attack = false
combo = 0;
max_combo = 5;
wait_to_attack = 0;
wait_time = 30;
move_wall_spd = 6;
move_locked_max_time = 10;
move_locked_time = 0;
on_wall = 0;
spells = new Spells();
sprite_idle = spr_player_idle;
sprite_attack_1 = spr_player_attack_1;
sprite_attack_2 = spr_player_attack_2;
sprite_attack_3 = spr_player_attack_3;
current_spel_cast = undefined;
spell_delay = 0;
max_spell_delay = 30;
bar_follow_time = 15;

max_spd_grav = 20;

inventory = new Inventory(self);

sword = 
{
	name : "Sword",
	damage : 1,
	current_level : 1,
	max_levels : 10,
	
	upgrade : function()
	{
		if (current_level < max_levels)
		{
			damage++;
			current_level++;
			return true;
		}
		return false;
	}
}

change_state = function(_state)
{
	if (state != STATES.ATTACK && state != STATES.DASH && state != STATES.CAST_SPELL)
		state = _state;
	else if (state == STATES.DASH && timer_to_dash == 0)
		state = _state;
}

get_damage = function(_enemy)
{
	var _x_sign = sign(x - _enemy.x);
	move_x = _x_sign * 12;
	move_y = -jump_spd;
	current_hp -= _enemy.base_damage;
	flashing = max_flashing;
	is_knockback = true;
	state = STATES.HIT;
	image_index = 0;
	alarm[0] = time_to_knockback;
	obj_show_status.wait_health_timer = bar_follow_time;
}

attack = function(_enemy)
{
	_enemy.GetDamage(sword.damage + get_bonus_damage());
}

get_bonus_damage = function()
{
	return floor((combo - 1) * (sword.current_level * 0.4));
}

get_moneys = function(_moneys)
{
	moneys += _moneys;
}

heal = function(_hp)
{
	if (_hp <= 0)
		_hp = 1;
	current_hp += _hp;
	if (current_hp > max_hp)
		current_hp = max_hp;
}

get_mana = function(_mana)
{
	current_mana += _mana;
	if (current_mana > max_mana)
		current_mana = max_mana;
}

spend_mana = function(_mana)
{
	if (current_mana >= _mana)
	{
		current_mana -= _mana;
		obj_show_status.wait_mana_timer = bar_follow_time;
		return true;
	}
	else
		return false;
}

increase_maxHp = function(_hp)
{
	if (_hp < min_increase_hp)
		_hp = min_increase_hp;
	max_hp += _hp;
}

decrease_maxHp = function(_hp)
{
	max_hp -= _hp;
	if (current_hp > max_hp)
		current_hp = max_hp;
}

increase_maxMana = function(_mana)
{
	if (_mana < min_increase_mana)
		_mana = min_increase_mana;
	max_mana += _mana;
}

decrease_maxMana = function(_mana)
{
	max_hp -= _mana;
}