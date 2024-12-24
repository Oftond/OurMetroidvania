draw_self();
//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

if (place_meeting(x, y, obj_item))
{
	draw_set_font(global.Tips);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text(x - sprite_get_width(spr_input_keyboard_up) - 5, bbox_top - 40, "<");
	draw_sprite(spr_input_keyboard_up, 0, x, bbox_top - 40);
		draw_text(x + sprite_get_width(spr_input_keyboard_up) + 5, bbox_top - 40, ">");
}