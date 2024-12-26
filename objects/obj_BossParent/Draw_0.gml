draw_self();
if (playerDetected || !playerDetected)
{
	var ofset=10;
	var pc;
	var x_pos=camera_get_view_x(view_camera[0]) + 30;
	var x2_pos = x_pos + camera_get_view_width(view_camera[0]) - 90;
	var y_pos=room_height - 80;
	var width=500;
	var hight=10
	var health_bar_widt1=400;
	var health_bar_high1=980;
	var health_bar_widt2=1500;
	var health_bar_high2=1000;
	pc = (current_hp / max_hp);
	draw_set_color(c_gray);
	draw_rectangle(x_pos,y_pos,x2_pos,y_pos + hight,false);
	draw_set_color(c_red);
	draw_rectangle(x_pos,y_pos,x2_pos * pc,y_pos + hight,false);
}