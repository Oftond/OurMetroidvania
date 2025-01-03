/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();
move_speed=0;
max_hp = 10;
current_hp = max_hp;
attack=spr_Glist_RightAttack
idle=spr_Glist_Idle;
hit=spr_Glist_Hit;
death=spr_death;
can_jump=false;
attack_mask=spr_Glist_RightAttack_mask;
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
Attacks=[{name:"hit",damage:2,animation:attack, distance_to_attack:(sprite_width / 2) + 20, attack_hitbox:attack_mask, attack_method:HitAttack}];