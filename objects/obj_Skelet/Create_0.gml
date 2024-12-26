event_inherited();
max_hp = 20;
current_hp = max_hp;
attack=spr_Skelet_attack;
death=spr_Skelet_death;
idle=spr_Skelet_idle;
hit=spr_Skelet_hit;
move=spr_Skelet_move;
jump=spr_Skelet_idle;
fall=spr_Skelet_idle;
attack_mask = spr_Skelet_attack_mask;

Attacks=[{name:"hit",damage:1,animation:attack,attack_hitbox:attack_mask}];