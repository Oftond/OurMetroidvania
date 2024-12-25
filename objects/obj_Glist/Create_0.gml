/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();
move_speed=0;
max_hp = 100;
current_hp = max_hp;
attack=spr_Glist_RightAttack
idle=spr_Glist_Idle;
hit=spr_Glist_Hit;
death=spr_death;
can_jump=false;
Attacks=[{name:"hit",damage:4,animation:attack}];