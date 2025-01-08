if (alpha > 1 || alpha < 0)
	alpha_spd *= -1;

draw_sprite_stretched_ext(sprite_index, 0, x, y, room_width, room_height, c_black, alpha);

alpha += alpha_spd;