event_inherited();

max_hp = 8;
current_hp = max_hp;

detection = 300;

attack_mask = spr_DefiledGoomba_attack_mask;
attack=spr_DefiledGoomba_attack;
death=spr_DefiledGoomba_death;
idle=spr_DefiledGoomba_idle;
hit=spr_DefiledGoomba_hit;
move=spr_DefiledGoomba_move;
fall=spr_DefiledGoomba_move;
can_jump=false;

count_coin_drop = 2;

HitAttack = function()
{
	if (current_attack == undefined)
		return;
	
	if ((obj_player.x >= x - current_attack.distance_to_attack && obj_player.x <= x + current_attack.distance_to_attack && obj_player.bbox_top > bbox_bottom))
	{
		change_state(STATE.attack);
		want_to_go = false;
		if (image_index >= 9 && sprite_index == current_attack.animation)
		{
			Fall();
		}
	}
	else if (state != STATE.attack)
	{
		want_to_go = false;
		Move();
	}
}

Fall = function()
{
	onGround = place_meeting(x,y+1,obj_game_manager.collision_wall);
	
	if(!onGround)
		move_y += g;
	
	if(place_meeting(x,move_y+y,obj_game_manager.collision_wall))
		move_y = 0;
	
	y += move_y;
}

Attacks=[{name:"hit",damage:1,animation:attack, distance_to_attack:sprite_width, attack_hitbox:attack_mask, attack_method:HitAttack}];