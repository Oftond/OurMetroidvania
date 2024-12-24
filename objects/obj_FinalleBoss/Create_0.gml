/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();
hp=15000;
max_hp=15000;
magic_attack=spr_FinalleBoss_attackMagic;
air_attack=spr_FinalleBoss_attackAir;
attack1=spr_FinalleBoss_attackSword1;
attack2=spr_FinalleBoss_attackSword2;
attack3=spr_FinalleBoss_attackSword3
death=spr_FinalleBoss_death;
idle=spr_FinalleBoss_idle;
hit=spr_FinalleBoss_hit;
move=spr_FinalleBoss_walk;
defence=spr_FinalleBoss_defend;
jump=spr_FinalleBoss_jump;
surf=spr_FinalleBoss_surf;
heal=spr_FinalleBoss_heal
fall=spr_FinalleBoss_down;

Attacks=[
{name:"magic_attack",damage:70,animation:magic_attack,attack_hitbox:spr_FinalleBoss_attackMagic_Mask},
{name:"air_attack",damage:70,animation:air_attack,attack_hitbox:spr_FinalleBoss_attackAir_Mask},
{name:"sword_attack1",damage:70,animation:attack1,attack_hitbox:spr_FinalleBoss_attackSword1_mask},
{name:"sword_attack2",damage:70,animation:attack2,attack_hitbox:spr_FinalleBoss_attackSword2_mask},
{name:"sword_attack3",damage:70,animation:attack3,attack_hitbox:spr_FinalleBoss_attackSword3_mask}];

Moves=[{name:"walk",animation:move},{name:"surf",animation:surf}];