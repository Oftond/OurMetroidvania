var _key_right = keyboard_check_pressed(vk_right);
var _key_left = keyboard_check_pressed(vk_left);
var _key_up = keyboard_check_pressed(vk_up);
var _key_down = keyboard_check_pressed(vk_down);
var _accept = keyboard_check_pressed(vk_enter);
var _next_page = keyboard_check_pressed(vk_pageup);
var _prev_page = keyboard_check_pressed(vk_pagedown);

show_debug_message(page)

if (_next_page)
	page++;
			
if (_prev_page)
	page--;
		
if (page > max_pages)
	page = 0;
			
if (page < 0)
	page = max_pages;

switch(page)
{
	case 0:
		if (_key_right)
			selected_index = (selected_index + 1) mod obj_inventory.count_equipment;
		if (_key_left)
			selected_index = (selected_index - 1 + (obj_inventory.count_equipment)) mod obj_inventory.count_equipment
		if (_key_up)
			selected_index = (selected_index - obj_inventory.max_in_row + (obj_inventory.count_equipment)) mod obj_inventory.count_equipment
		if (_key_down)
			selected_index = (selected_index + obj_inventory.max_in_row) mod obj_inventory.count_equipment
	
		choice_amulet = obj_player.inventory.amulets[selected_index];

		if (choice_amulet != undefined)
		{
			distance_x = sprite_get_height(choice_amulet.sprite) - 50;
			distance_y = sprite_get_width(choice_amulet.sprite) - 50;
			show_debug_message(distance_x)
		}
		else
		{
			distance_x = sprite_get_width(spr_inventory_player_equip);
			distance_y = sprite_get_height(spr_inventory_player_equip);
		}

		if (_accept && choice_amulet != undefined)
		{
			obj_player.inventory.equip_emulet(selected_index);
		}
	break;
	
	case 1:
	break;
	
	case 2:
	break;
}