//Враг готов

event_inherited();

count_coin_drop = 2;

timeDelay = 30;

//Метод, выполняющий всю логику конкретной атаки врага
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

max_hp = 5;
current_hp = max_hp;

attack=spr_Mushroom2_attack;
death=spr_Mushroom2_death;
idle=spr_Mushroom2_idle;
hit=spr_Mushroom2_hit;
move=spr_Mushroom2_move;
jump=spr_Mushroom2_idle;
fall=spr_Mushroom2_idle;
attack_mask = spr_Mushroom2_attack_mask;

Attacks=[{name:"hit",damage:30,animation:attack, distance_to_attack:(sprite_width / 2) + 20, attack_hitbox:attack_mask, attack_method:HitAttack}];