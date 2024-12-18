/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
if (!playerDetected)
{
	event_inherited();
}
else
{	
	if(passed>=maxPass)
	{
		passed=0;
		shouldAttack=true;
		chooseSelected=false;
	}
	move_x=dir*move_speed;
	if(attackDelay<=0&&!chooseSelected)
	{
		battleWithPlayer();
	}
	if(attackDelay>0)
		attackDelay--;
	var locate=sign(x-obj_player.x);
	if(locate!=0)
	{
		image_xscale=-locate;
	}
	if(!want_to_go)
		move_x=0;
	if(!want_to_jump)
		move_y=0var sub_pixel=0.5;
	

	if (place_meeting(x+move_x,y,obj_game_manager.collision_tilemap))
	{
		var pixel_check=sub_pixel* sign(move_x);
		while(!place_meeting(x+pixel_check,y,obj_game_manager.collision_tilemap))
			x+=pixel_check
		move_x=0;
		dir*=-1;
	}
	y+=move_y;
	x+=move_x;
	if(move_x!=0)
		passed+=move_x;
	
}
show_debug_message(shouldAttack)
passed+=abs(move_x);