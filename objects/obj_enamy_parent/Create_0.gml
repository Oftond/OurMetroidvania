event_inherited();

detection = 200;
base_damage = 1;

//Количество выпадаемыхс врага монет
count_coin_drop = 1;

//Количество выпадаемой врага маны
count_mana_drop = 1;

GetDamage = function(_damage)
{
	current_hp -= _damage;
	if(current_hp < 0)
		current_hp = 0;
}

change_state = function(_state)
{
	if(state != STATE.jump)
		state = _state;
	else if(_state == STATE.fall)
		state = _state;
}

move_x = 0;
move_y = 0;
jump_speed = 25;
g = 1;
max_move_speed = 2;
move_speed = max_move_speed;
dir = choose(-1, 1);
onGround = true;
want_to_jump = false;

//Время всей задержки (атаки и передвижения)
timeDelay = 60;

//Задержка после атаки
attackDelay = 0;

want_to_go = true;

//Задержка после разворота, перед тем, как пойти в
//другую сторону
go_delay = 0;

stop = false;

chooseSelected = false;
current_attack = undefined;

attack=spr_Batman_Attack;
death=spr_death2;
idle=spr_Batman_fly;
hit=spr_Batman_Hit;
move=spr_Batman_fly;
jump=spr_Batman_fly;
fall=spr_Batman_fly;
dash=spr_Batman_fly;
slide=spr_Batman_fly;
attack_mask = spr_Batman_Attack_Mask;
can_jump=true;
playerDetected=false;

//Метод, выполняющий всю логику конкретной атаки врага
//В этом методе должно быть прописана вся логика одной
//конкретной атаки врага
//Для каждой отдельной атаки, у врага должно быть по методу
//(разумеется с разными названиями), если у врага несколько
//атак. Если атака одна, то только один метод.
HitAttack = function()
{
	show_message("Атакуем!")
}

//Вся логика передвижения, включая проверки на столкновения.
//Если враг имеет несколько способов перемещения, то и таких
//методов у него должно быть несколько, каждый из которых
//по своему передвигает врага.
//Он метод можно переопределить в наследниках, если это
//необходимо (если изменяется логика передвижения данного
//метода или он плохо работает в каком то из наследников)
Move = function()
{
	if(!want_to_go)
		return;
	move_x = dir * move_speed;
	
	//Проверка на пустое место, чтобы он не упал, а развернулся
	//и пошел в другую сторону
	if (place_empty(x + move_x + (25 * sign(move_x)), y + 50, obj_game_manager.collision_wall) && can_jump)
	{
		go_delay = timeDelay;
		stop = true;
		move_x = 0;
	}
	
	onGround = place_meeting(x,y+1,obj_game_manager.collision_wall);
	if(onGround)
	{
		if(move_x!=0)
		{		
			change_state(STATE.move);
		}
		else
		{
			change_state(STATE.idle)
		}
	}
	else if(move_y>=0&&can_jump)
	{
		change_state(STATE.jump)
	}
	if(move_y<0&&!onGround&&can_jump)
	{
		change_state(STATE.jump)
		move_y+=g;
	}
	else if(move_y>=0&&!onGround&&can_jump)
	{
		change_state(STATE.fall)
		move_y+=g;
	}
	var sub_pixel=0.5;
	if(place_meeting(x,move_y+y,obj_game_manager.collision_wall))
	{
		var pixel_check=sub_pixel* sign(move_y);
		while(!place_meeting(x,pixel_check+y,obj_game_manager.collision_wall))
			y+=pixel_check
		move_y=0;
	}

	if (place_meeting(x+move_x,y,obj_game_manager.collision_wall) && !stop)
	{
		var pixel_check=sub_pixel* sign(move_x);
		while(!place_meeting(x+pixel_check,y,obj_game_manager.collision_wall))
			x+=pixel_check
		move_x=0;
		go_delay = timeDelay;
		stop = true;
	}
	
	if(onGround)
	{
		if(move_x!=0&&state!=STATE.attack)
		{
			change_state(STATE.move);
		}
		else if(state!=STATE.attack && onGround)
		{
			change_state(STATE.idle);
		}
	}
	else if(move_y>=0&&!onGround)
	{
		change_state(STATE.fall)
	}
	else if(move_y<0&&!onGround)
	{
		change_state(STATE.jump)
	}

	y += move_y;
	x += move_x;
}

//Массив атак, имеющий структуры всех атак врага.
//В структуре одной атаки должно быть ее имя, наносимый урон,
//анимация, distance_to_attack - дистанция, на которой враг
//сможет попасть по игроку данной атакой, attack_hitbox - хитбокс
//удара для данной атаки, attack_method - метод, выполняющий всю
//логику атаки данной атакой
Attacks=[{name:"hit",damage:2,animation:attack, distance_to_attack:sprite_width, attack_hitbox:attack_mask, attack_method:HitAttack}];

//Все для передвижения врага
Moves=[{name:"walk",animation:move,move_method:Move}];

//Метод не изменять и не переопределять.
//Он вызывается в момент атаки игрока и вызывает нужный метод
//для атаки игрока
battleWithPlayer = function()
{
	if (stop)
		change_state(STATE.idle);
	if (state == STATE.attack)
		return;
	if (!chooseSelected && attackDelay <= 0)
	{
		chooseSelected = true;
		var attackChoice = irandom(array_length(Attacks) - 1);
		current_attack = Attacks[attackChoice];
		attack=current_attack.animation;
		base_damage=current_attack.damage;
		want_to_go=false;
		current_attack.attack_method();
	}
	else if (chooseSelected && attackDelay <= 0 && current_attack != undefined)
		current_attack.attack_method();
}

//Метод, отображающий здоровье врага
//Переопределять только при крайней необходимости (например,
//в родителе босса)
drawHp = function()
{
	if (current_hp < max_hp && current_hp > 0)
	{
		var ofset=30;
		var pc;
		var x_pos=x-60;
		var y_pos=bbox_top-ofset;
		var width=130;
		var hight=10
		pc = (current_hp / max_hp);
		draw_set_color(c_gray);
		draw_rectangle(x_pos,y_pos,x_pos+width,y_pos+hight,false);
		draw_set_color(c_red);
		draw_rectangle(x_pos,y_pos,x_pos+width*pc,y_pos+hight,false);
		draw_set_color(c_white);
	}
}