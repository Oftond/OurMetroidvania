event_inherited();

detection = 500;
base_damage = 1;

GetDamage = function(_damage)
{
	current_hp -= _damage;
	if(current_hp < 0)
		current_hp = 0;
	else if (current_hp > 0)
		change_state(STATE.hit);
}

change_state = function(_state)
{
	if(state != STATE.jump && state != STATE.attack && state != STATE.hit)
		state = _state;
	else if(_state == STATE.fall)
		state = _state;
}

move_x = 0;
move_y = 0;
jump_speed = 25;
g = 1;
move_speed = 2;
dir = choose(-1, 1);
onGround = true;
want_to_jump = false;
timeDelay = 60;
attackDelay = timeDelay;
want_to_go = true;
chooseSelected = false;
current_attack = undefined;

attack=spr_Batman_Attack;
death=spr_death2;
idle=spr_Batman_fly;
hit=spr_Batman_Hit;
move=spr_Batman_fly;
jump=spr_Batman_fly;
fall=spr_Batman_fly;
dash=spr_Batman_fly;
slide=spr_Batman_fly;
attack_mask = spr_Batman_Attack_Mask;
can_jump=true;
playerDetected=false;

Attacks=[{name:"hit",damage:2,animation:attack,attack_hitbox:attack_mask}];

Moves=[{name:"walk",animation:move}];

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