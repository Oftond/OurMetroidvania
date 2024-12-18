/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();

detection=1000;
passed=0;
can_jump=true;
stamina=50;
maxPass=100;
maxStamina=50;
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
			var attacke = Attacks[attackChoice];
			change_state(STATE.attack);
			attack=attacke.animation;
			base_damage=attacke.damage;
			mask_index=attacke.animation;
			want_to_go=false;
		break;
		
		case STATE.move:
			state = STATE.move;
			want_to_go=true;
		break;
	}
}