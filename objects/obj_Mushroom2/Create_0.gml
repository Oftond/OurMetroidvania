event_inherited();

HitAttack = function()
{
	if (current_attack == undefined)
		return;
	
	var player_distance = point_distance(x,y,obj_player.x,obj_player.y);
	if (player_distance > current_attack.distance_to_attack)
	{
		want_to_go = true;
		Move();
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

Attacks=[{name:"hit",damage:1,animation:attack, distance_to_attack:(sprite_width / 2) + 10, attack_hitbox:attack_mask, attack_method:HitAttack}];