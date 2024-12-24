/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();
hp=2500;
max_hp=2500;

move=spr_Gnom_walk;
attack1=spr_Gnom_attack;
attack2=spr_Gnom_attack2;
attack3=spr_Gnom_attack3;
attack4=spr_Gnom_attack4;
airAttack=spr_Gnom_airAttack;
death=spr_Gnom_death;
idle=spr_Gnom_idle;
hit=spr_Gnom_hit;
defence=spr_Gnom_defence;
jump=spr_Gnom_jump;
fall=spr_Gnom_fall;
dash=spr_Gnom_dash;
can_jump=true;

Attacks=[
{name:"air_attack",damage:70,animation:airAttack,attack_hitbox:spr_Gnom_airAttack_mask},
{name:"hammer_attack4",damage:70,animation:attack4,attack_hitbox:spr_Gnom_attack4_mask},
{name:"hammer_attack1",damage:70,animation:attack1,attack_hitbox:spr_Gnom_attack_mask},
{name:"hammer_attack2",damage:70,animation:attack2,attack_hitbox:spr_Gnom_attack2_mask},
{name:"hammer_attack3",damage:70,animation:attack3,attack_hitbox:spr_Gnom_attack3_mask}];
Moves=[{name:"walk",animation:move}];