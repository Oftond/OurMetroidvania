/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
cd=2;
detection=500;
hp=5;
base_damage=1
GetDamage=function(_character)
{
	hp-=_character.damage;
	if(hp<0)
		hp=0;
}
change_state=function(_state)
{
	if(state!=STATE.jump)
		state=_state;
	else if(_state==STATE.fall)
		state=_state;
}
can_jump=true;
move_x=0;
move_y=0;
jump_speed=25;
g=1;
move_speed=2;
dir=1;
onGround=true;
want_to_jump=false;

state=STATE.idle;

attack=spr_Batman_Attack;
death=spr_Bataman_death;
idle=spr_Batman_fly;
hit=spr_Batman_Hit;
move=spr_Batman_fly;
jump=spr_Batman_fly;
fall=spr_Batman_fly;
dash=spr_Batman_fly;
slide=spr_Batman_fly;

mask_index=sprite_index;

Attacks=[{name:"hit",damage:2,animation:attack}];

Moves=[{name:"walk",animation:move}];