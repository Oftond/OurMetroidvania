if (InputPressed(Input.next_page) && !instance_exists(obj_inventory_dark))
{
	selected_index = 0;
	page++;
	with (instance_create_depth(obj_inventory.x, obj_inventory.y, -99999, obj_inventory_dark))
	{
		image_xscale = obj_inventory.image_xscale;
		image_yscale = obj_inventory.image_yscale;
	}
}

if (InputPressed(Input.previous_page) && !instance_exists(obj_inventory_dark))
{
	selected_index = 0;
	page--;
	with (instance_create_depth(obj_inventory.x, obj_inventory.y, -99999, obj_inventory_dark))
	{
		image_xscale = obj_inventory.image_xscale;
		image_yscale = obj_inventory.image_yscale;
	}
}
		
if (page > max_pages)
	page = 0;
			
if (page < 0)
	page = max_pages;

switch(page)
{
	case 0:
		if (InputPressed(Input.right) || InputStickHorizontalPressed() >= ValueGamepadPressed)
			selected_index = (selected_index + 1) mod obj_inventory.count_equipment;
		if (InputPressed(Input.left) || InputStickHorizontalPressed() <= -ValueGamepadPressed)
			selected_index = (selected_index - 1 + (obj_inventory.count_equipment)) mod obj_inventory.count_equipment
		if (InputPressed(Input.up) || InputStickVerticalPressed() <= -ValueGamepadPressed)
			selected_index = (selected_index - obj_inventory.max_in_row + (obj_inventory.count_equipment)) mod obj_inventory.count_equipment
		if (InputPressed(Input.down) || InputStickVerticalPressed() >= ValueGamepadPressed)
			selected_index = (selected_index + obj_inventory.max_in_row) mod obj_inventory.count_equipment
	
		choice_amulet = obj_player.inventory.amulets[selected_index];

		if (choice_amulet != undefined)
		{
			distance_x = sprite_get_height(choice_amulet.icon) - 50;
			distance_y = sprite_get_width(choice_amulet.icon) - 50;
		}
		else
		{
			distance_x = sprite_get_width(spr_inventory_player_equip);
			distance_y = sprite_get_height(spr_inventory_player_equip);
		}

		if (InputPressed(Input.accept) && choice_amulet != undefined)
		{
			obj_player.inventory.equip_emulet(selected_index);
		}
	break;
	
	case 1:
		if (InputPressed(Input.right) || InputStickHorizontalPressed() >= ValueGamepadPressed)
			selected_index--;
		if (InputPressed(Input.left) || InputStickHorizontalPressed() <= -ValueGamepadPressed)
			selected_index++;
		if (InputPressed(Input.up) || InputStickVerticalPressed() <= -ValueGamepadPressed)
			selected_index++;
		if (InputPressed(Input.down) || InputStickVerticalPressed() >= ValueGamepadPressed)
			selected_index--;
		
		if (selected_index < 0)
		{
			selected_index = obj_player.spells.max_number_spells - 1;
		}
		else if (selected_index >= obj_player.spells.max_number_spells)
			selected_index = 0;
		
		choice_spell = obj_player.spells.spells[selected_index];
		
		distance_x = sprite_get_width(spr_spellIcon_holder) / 2;
		distance_y = sprite_get_height(spr_spellIcon_holder) / 2;

		if (InputPressed(Input.accept) && choice_spell != undefined)
			obj_player.spells.equip_spell(selected_index);
	break;
	
	case 2:
	break;
}