/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
switch (state)
{		
	case STATE.attack:
	sprite_index=attack;
	break;
	case STATE.death:
	sprite_index=death;			
	break;
	case STATE.hit:
	sprite_index=hit;
	break;
	case STATE.inactive:
	sprite_index=idle;
	break;
	case STATE.move:
	sprite_index=move;
	break;
	case STATE.apear:	
	sprite_index=apear;
}
