event_inherited();

max_hp = 5;
current_hp = max_hp;

attack=spr_Mushroom2_attack;
death=spr_Mushroom2_death;
idle=spr_Mushroom2_idle;
hit=spr_Mushroom2_hit;
move=spr_Mushroom2_move;
jump=spr_Mushroom2_idle;
fall=spr_Mushroom2_idle;
attack_mask = spr_Mushroom2_attack_mask;

Attacks=[{name:"hit",damage:1,animation:attack,attack_hitbox:attack_mask}];