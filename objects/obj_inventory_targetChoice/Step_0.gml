if (!instance_exists(obj_inventory_element_parent))
	instance_destroy(self);

var _key_right = keyboard_check_pressed(vk_right);
var _key_left = keyboard_check_pressed(vk_left);
var _key_up = keyboard_check_pressed(vk_up);
var _key_down = keyboard_check_pressed(vk_down);
var _accept = keyboard_check_pressed(vk_end);

if (_key_right)
{
	var _inst = instance_nearest(x + distance_to_hud, y, obj_inventory_element_parent);
	if (_inst.state == state)
		if (place_meeting(x + distance_to_hud, y, obj_inventory_element_parent))
			x = _inst.x;
}
if (_key_left)
{
	var _inst = instance_nearest(x - distance_to_hud, y, obj_inventory_element_parent);
	if (_inst.state == state)
		if (place_meeting(x - distance_to_hud, y, obj_inventory_element_parent))
			x = _inst.x;
}
if (_key_up)
{
	var _inst = instance_nearest(x, y - distance_to_hud, obj_inventory_element_parent);
	if (_inst.state == state)
		if (place_meeting(x, y - distance_to_hud, obj_inventory_element_parent))
			y = _inst.y;
}
if (_key_down)
{
	var _inst = instance_nearest(x, y + distance_to_hud, obj_inventory_element_parent);
	if (_inst.state == state)
		if (place_meeting(x, y + distance_to_hud, obj_inventory_element_parent))
			y = _inst.y;
}