/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
hp=5;
damage=1
name="Batman";
attack=function(_character)
{
	var _post=sign(_character.x-self.x);
	if(_post!=0)
		image_xscale=_post;
	_character.GetDamage(damage);
}
GetDamage=function(_character)
{
	hp-=_character.damage;
}

move_x=0;
move_speed=2;
dir=1;

state=STATE.inactive;
changeState=function(STATE)
{
	if(STATE!=state)
	{
		switch (state)
		{		
			case STATE.attack:
			image_index=0;
			sprite_index=attack;
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
			case STATE.apear:
			image_index=0;
			sprite_index=apear;
			break;
		}
	}
}
attack=spr_Batman_Attack;
death=spr_Bataman_death;
idle=spr_Batman_fly;
hit=spr_Batman_Hit;
move=spr_Batman_fly
apera=spr_Batman_fly