/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
switch (state)
{		
	case STATE.attack:
	if(sprite_index!=attack)
	{
		image_index=0;
		sprite_index=attack;
		with(instance_create_depth(x,y,depth-1,obj_attack_hitbox))
		{
			sprite_index=other.current_attack.attack_hitbox;
			image_index=self.image_index;
		}
	}
	if(image_index>=image_number-1)
	{
		chooseSelected=false
		shouldAttack=false;
	}
	break;
	
	case STATE.death:
	if(sprite_index!=death)
	{
		image_index=0;
		sprite_index=death;
	}			
	break;
	
	case STATE.hit:
	if(sprite_index!=hit)
	{
		image_index=0;
		sprite_index=hit;
	}		
	break;
	
	case STATE.idle:
	if(sprite_index!=idle)
	{
		image_index=0;
		sprite_index=idle;
	}	
	if(attackDelay<=0)
	{
		shouldAttack=true
		chooseSelected=false;
	}
	break;
	
	case STATE.move:
	if(sprite_index!=move)
	{
		image_index=0;
		sprite_index=move;
	}
	break;
	
	case STATE.apear:	
	if(sprite_index!=apear)
	{
		image_index=0;
		sprite_index=apear;
	}		
	break;
	
	case STATE.heal:	
	if(sprite_index!=heal)
	{
		image_index=0;
		sprite_index=heal;
	}		
	break;
	
	case STATE.defence:	
	if(sprite_index!=defence)
	{
		image_index=0;
		sprite_index=defence;
	}		
	break;
	
	case STATE.jump:	
	if(sprite_index!=jump)
	{
		image_index=0;
		sprite_index=jump;
	}		
	break;
	
	case STATE.fall:	
	if(sprite_index!=fall)
	{
		image_index=0;
		sprite_index=fall;
	}		
	break;
	case STATE.dash:	
	if(sprite_index!=dash)
	{
		image_index=0;
		sprite_index=dash;
	}		
	break;
	case STATE.slide:	
	if(sprite_index!=slide)
	{
		image_index=0;
		sprite_index=slide;
	}		
	break;
}
