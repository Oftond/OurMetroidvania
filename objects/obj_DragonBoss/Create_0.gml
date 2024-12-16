/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
randomize();
// Inherit the parent event
event_inherited();


attackBreathe=spr_DragonBoss_breathAttack;
attackTaile=spr_DragonBoss_tailAttack;
idle=spr_DragonBoss_idle;
move=spr_DragonBoss_idle;
attackTail=function(_character)
{
	stateAttacked=STATE_ATTACKS.attackTail;
	_character.GetDamage()
}
attackBreath=function(_character)
{
	stateAttacked=STATE_ATTACKS.attackBreath;	
	_character.GetDamage()
}
enum STATE_ATTACKS
{
	attackTail,
	attackBreath
}
stateAttacked=STATE_ATTACKS.attackBreath;
changeState=function(STATE)
{
	if(STATE!=state)
	{
		switch (state)
		{		
			case STATE.attack:
				switch(stateAttacked)
				{
					case STATE_ATTACKS.attackBreath:				
						image_index=0;
						sprite_index=attackBreathe;
				
					case STATE_ATTACKS.attackTail:				
						image_index=0;
						sprite_index=attackTaile;
				}
			break;
			case STATE.death:
				image_index=0;
				sprite_index=death;			
			break;
			case STATE.hit:
				image_index=0;
				sprite_index=hit;
			break;
			case STATE.inactive:
				image_index=0;
				sprite_index=idle;
			break;
			case STATE.move:
				image_index=0;
				sprite_index=move;
			break;
		}
	}
}