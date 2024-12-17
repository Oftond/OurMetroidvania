draw_sprite(sprite_leftTop, 0, x - distance - move_x, y - distance - move_y);
draw_sprite(sprite_rightTop, 0, x + distance + move_x, y - distance - move_y);
draw_sprite(sprite_rightBottom, 0, x + distance + move_x, y + distance + move_y);
draw_sprite(sprite_leftBottom, 0, x - distance - move_x, y + distance + move_y);

move_x += 1 * dir;
move_y += 1 * dir;
if ((move_x < -length && move_y < -length) || (move_x > length && move_y > length))
{
	dir *= -1;
}