/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();

max_hp = 8;
current_hp = max_hp;

attack=spr_Mushroom_attack;
move=spr_Mushroom_move;
idle=spr_Mushroom_move;
hit=spr_Mushroom_move;
jump=spr_Mushroom_move;
fall=spr_Mushroom_move;

Attacks=[{name:"hit",damage:1,animation:attack, attack_hitbox:spr_Mushroom2_attack_mask}];