draw_sprite(sprite_leftTop, 0, x - distance_x - move_x, y - distance_y - move_y);
draw_sprite(sprite_rightTop, 0, x + distance_x + move_x, y - distance_y - move_y);
draw_sprite(sprite_rightBottom, 0, x + distance_x + move_x, y + distance_y + move_y);
draw_sprite(sprite_leftBottom, 0, x - distance_x - move_x, y + distance_y + move_y);

if (delay_to_move <= 0)
{
	move_x += 1 * dir;
	move_y += 1 * dir;
}

if (((move_x < -length && move_y < -length) || (move_x > length && move_y > length)) && delay_to_move <= 0)
{
	dir *= -1;
	delay_to_move = delay_time;
}

if (delay_to_move > 0)
	delay_to_move--;