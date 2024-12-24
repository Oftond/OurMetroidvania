/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

draw_self();
var ofset=10;
var pc;
var x_pos=camera_get_view_x(view_camera[0]+global.bb/2);
var y_pos=camera_get_view_y(view_camera[0]+global.bb2-30);
var width=130;
var hight=10
var health_bar_widt1=400;
var health_bar_high1=980;
var health_bar_widt2=1500;
var health_bar_high2=1000;
pc = (hp / max_hp);
draw_set_color(c_aqua);
draw_rectangle(health_bar_widt1,health_bar_high1,health_bar_widt2+width,health_bar_high2+hight,false);
draw_set_color(c_red);
if(hp>0)	
	draw_rectangle(health_bar_widt1,health_bar_high1,health_bar_widt2+width*pc,health_bar_high2+hight,false);