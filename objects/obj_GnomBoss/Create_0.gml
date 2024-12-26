event_inherited();
max_hp = 40;
current_hp = max_hp;

move=spr_Gnom_walk;
attack1=spr_Gnom_attack;
attack2=spr_Gnom_attack2;
attack3=spr_Gnom_attack3;
attack4=spr_Gnom_attack4;
airAttack=spr_Gnom_airAttack;
attack_mask_1 = spr_Gnom_airAttack_mask;
attack_mask_2 = spr_Gnom_attack4_mask;
attack_mask_3 = spr_Gnom_attack_mask;
attack_mask_4 = spr_Gnom_attack2_mask;
attack_mask_5 = spr_Gnom_attack3_mask;
death=spr_Gnom_death;
idle=spr_Gnom_idle;
hit=spr_Gnom_hit;
defence=spr_Gnom_defence;
jump=spr_Gnom_jump;
fall=spr_Gnom_fall;
dash=spr_Gnom_dash;
can_jump=true;

Attacks=[
{name:"air_attack",damage:2,animation:airAttack,attack_hitbox:attack_mask_1},
{name:"hammer_attack4",damage:2,animation:attack4,attack_hitbox:attack_mask_2},
{name:"hammer_attack1",damage:2,animation:attack1,attack_hitbox:attack_mask_3},
{name:"hammer_attack2",damage:2,animation:attack2,attack_hitbox:attack_mask_4},
{name:"hammer_attack3",damage:2,animation:attack3,attack_hitbox:attack_mask_5}];
Moves=[{name:"walk",animation:move}];