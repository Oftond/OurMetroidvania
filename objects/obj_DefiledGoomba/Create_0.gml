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

Attacks=[{name:"hit",damage:1,animation:attack,attack_hitbox:attack_mask}];