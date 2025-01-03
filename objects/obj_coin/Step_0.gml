move_y+=g;
var sub_pixel=0.5;
if(place_meeting(x,move_y+y,obj_game_manager.collision_wall))
{
	var pixel_check=sub_pixel* sign(move_y);
	while(!place_meeting(x,pixel_check+y,obj_game_manager.collision_wall))
		y+=pixel_check
	move_y=0;
}
y+=move_y;