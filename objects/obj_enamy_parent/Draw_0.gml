draw_self();

if (current_hp < max_hp && current_hp > 0)
{
	var ofset=10;
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