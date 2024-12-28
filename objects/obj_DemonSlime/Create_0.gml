event_inherited();
max_hp = 100;
current_hp = max_hp;

count_coin_drop = 20;

attack_mask=spr_DemonSlime_attack_mask;
death=spr_DemonSlime_death;
idle=spr_DemonSlime_idle;
hit=spr_DemonSlime_hit;
move=spr_DemonSlime_walk;
jump=spr_DemonSlime_idle;
fall=spr_DemonSlime_idle;
attack=spr_DemonSlime_attack;

HitAttack = function()
{
	if (current_attack == undefined || state == STATE.attack)
		return;
	
	var player_distance = point_distance(x,y,obj_player.x,obj_player.y);
	if (player_distance > current_attack.distance_to_attack)
	{
		want_to_go = true;
		Move();
		if (sign(obj_player.x - x) != 0)
			dir = sign(obj_player.x - x);
	}
	else
	{
		change_state(STATE.attack);
		want_to_go = false;
	}
}

Attacks=[{name:"hit",damage:1,animation:attack, distance_to_attack:(sprite_width / 2) + 20, attack_hitbox:attack_mask, attack_method:HitAttack}];