/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
move_x=dir*move_speed;

var sub_pixel=0.5;
if (place_meeting(x+move_x,y,obj_game_manager.collision_tilemap))
{
	var pixel_check=sub_pixel* sign(move_x);
	while(!place_meeting(x+pixel_check,y,obj_game_manager.collision_tilemap))
		x+=pixel_check
	move_x=0;
	dir*=-1;
}
if(move_x!=0)
{
	state=STATE.move;
}
else
	state=STATE.inactive;
x+=move_x;
image_xscale=-sign(dir);