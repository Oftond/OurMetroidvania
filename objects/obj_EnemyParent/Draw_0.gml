/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
draw_self();
var ofset=10;
var pc;
var x_pos=x-60;
var y_pos=bbox_top-ofset;
var width=130;
var hight=10
pc = (hp / max_hp);
draw_set_color(c_aqua);
draw_rectangle(x_pos,y_pos,x_pos+width,y_pos+hight,false);
draw_set_color(c_red);
if(hp>0)
	draw_rectangle(x_pos,y_pos,x_pos+width*pc,y_pos+hight,false);