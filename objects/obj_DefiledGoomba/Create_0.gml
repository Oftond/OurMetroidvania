event_inherited();

max_hp = 8;
current_hp = max_hp;

detection = sprite_get_width(sprite_index);
attack_mask = spr_DefiledGoomba_attack_mask;
attack=spr_DefiledGoomba_attack;
death=spr_DefiledGoomba_death;
idle=spr_DefiledGoomba_idle;
hit=spr_DefiledGoomba_hit;
move=spr_DefiledGoomba_move;
fall=spr_DefiledGoomba_move;
can_jump=false;

Attacks=[{name:"hit",damage:1,animation:attack, distance_to_attack:sprite_width, attack_hitbox:attack_mask}];

battleWithPlayer = function()
{
	if (!chooseSelected)
	{
		chooseSelected = true;
		change_state(STATE.attack);
		var attackChoice = irandom(array_length(Attacks) - 1);
		current_attack = Attacks[attackChoice];
		change_state(STATE.attack);
		attack=current_attack.animation;
		base_damage=current_attack.damage;
		want_to_go=false;
	}
}