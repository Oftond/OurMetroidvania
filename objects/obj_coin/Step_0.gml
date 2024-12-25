/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
move_y+=g;
var sub_pixel=0.5;
if(place_meeting(x,move_y+y,obj_game_manager.collision_tilemap))
{
	var pixel_check=sub_pixel* sign(move_y);
	while(!place_meeting(x,pixel_check+y,obj_game_manager.collision_tilemap))
		y+=pixel_check
	move_y=0;
}
y+=move_y;