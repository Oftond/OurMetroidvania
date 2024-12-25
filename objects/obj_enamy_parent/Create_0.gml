event_inherited();
cd=2;
detection=500;
hp=5;
max_hp=5;
base_damage=1
GetDamage=function(_character)
{
	hp-=_character.damage;
	if(hp<0)
		hp=0;
}
change_state=function(_state)
{
	if(state!=STATE.jump && state != STATE.attack)
		state=_state;
	else if(_state==STATE.fall)
		state=_state;
}
move_x=0;
move_y=0;
jump_speed=25;
g=1;
move_speed=2;
dir=1;
onGround=true;
want_to_jump=false;
timeDelay=60;
attackDelay=timeDelay;
want_to_go=true;
shouldAttack=true;
chooseSelected=false;
state=STATE.idle;
current_attack=undefined;

attack=spr_Batman_Attack;
death=spr_death;
idle=spr_Batman_fly;
hit=spr_Batman_Hit;
move=spr_Batman_fly;
jump=spr_Batman_fly;
fall=spr_Batman_fly;
dash=spr_Batman_fly;
slide=spr_Batman_fly;
can_jump=true;
playerDetected=false;

Attacks=[{name:"hit",damage:2,animation:attack,attack_hitbox:spr_Batman_Attack_Mask}];

Moves=[{name:"walk",animation:move}];

battleWithPlayer=function()
{
	var ChoseState=-1;
	if(!shouldAttack)
	{
		if(stamina>=10)
		{				
			ChoseState=choose(STATE.attack,STATE.idle,STATE.move);
		}		
		else
		{
			ChoseState=STATE.idle;
		}
		chooseSelected=true;		
	}
	else
	{
		if(stamina>=10)
		{				
			ChoseState=STATE.attack;
		}		
		else
		{
			ChoseState=STATE.idle;
		}
		chooseSelected=true;
	}
	switch(ChoseState)
	{
		case STATE.idle:
			stamina+=10;
			if(attackDelay==0)
			{
				shouldAttack=false;
				attackDelay=timeDelay;
			}
			state = STATE.idle;
			want_to_go=false;
		break;
		
		case STATE.attack:
			stamina -= 10;
			var attackChoice = irandom(array_length(Attacks)-1);
			current_attack = Attacks[attackChoice];
			change_state(STATE.attack);
			attack=current_attack.animation;
			base_damage=current_attack.damage;
			want_to_go=false;
		break;
		
		case STATE.move:
			state = STATE.move;
			want_to_go=true;
		break;
	}
}