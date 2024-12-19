if (!instance_exists(obj_inventory_element_parent))
	instance_destroy(self);

var _key_right = keyboard_check_pressed(vk_right);
var _key_left = keyboard_check_pressed(vk_left);
var _key_up = keyboard_check_pressed(vk_up);
var _key_down = keyboard_check_pressed(vk_down);
var _accept = keyboard_check_pressed(vk_enter);

if (_key_right)
{
	var _inst = instance_nearest(x + distance_to_hud, y, obj_inventory_element_parent);
	if (place_meeting(x + distance_to_hud, y, obj_inventory_element_parent))
		x = _inst.x;
}
if (_key_left)
{
	var _inst = instance_nearest(x - distance_to_hud, y, obj_inventory_element_parent);
	if (place_meeting(x - distance_to_hud, y, obj_inventory_element_parent))
		x = _inst.x;
}
if (_key_up)
{
	var _inst = instance_nearest(x, y - distance_to_hud, obj_inventory_element_parent);
	if (place_meeting(x, y - distance_to_hud, obj_inventory_element_parent))
		y = _inst.y;
}
if (_key_down)
{
	var _inst = instance_nearest(x, y + distance_to_hud, obj_inventory_element_parent);
	if (place_meeting(x, y + distance_to_hud, obj_inventory_element_parent))
		y = _inst.y;
}

if (state == STATESTARGET.EQUIPMENT && _accept)
{
	if (obj_player.inventory.is_amulet_index(obj_player.inventory.amulets, choice_hud.index))
	{
		var _emulet_choice = obj_player.inventory.amulets[choice_hud.index];
		if (!_emulet_choice.is_equipped)
		{
			obj_player.inventory.equip_emulet(choice_hud.index);
		}
		else
			obj_player.inventory.unequip_emulet(obj_player.inventory.equip_amulets, choice_hud.index);
	}
}
else if (state == STATESTARGET.EQUIP && _accept)
{
	if (obj_player.inventory.is_amulet_index(obj_player.inventory.equip_amulets, choice_hud.index))
	{
		var _emulet_choice = obj_player.inventory.equip_amulets[choice_hud.index];
		obj_player.inventory.unequip_emulet(obj_player.inventory.equip_amulets, choice_hud.index);
	}
}