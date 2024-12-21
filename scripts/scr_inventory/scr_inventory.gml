function Inventory(_player) constructor
{
	player = _player;
	items = [];
	max_number_amulets = 18;
	amulets = array_create(max_number_amulets, undefined);
	max_cells_amulets = 3;
	equip_amulets = array_create(max_cells_amulets, undefined);
	
	add_new_cell = function()
	{
		max_cells_amulets++;
	}
	
	add_amulet = function(_amulet)
	{
		for (var i = 0; i < max_number_amulets; i++)
		{
			if (amulets[i] == undefined)
			{
				amulets[i] = _amulet;
				return true;
			}
		}
		return false;
	}
	
	equip_emulet = function(_index)
	{
		if (!amulets[_index].is_equipped)
		{
			for (var i = 0; i < max_cells_amulets; i++)
			{
				if (equip_amulets[i] == undefined)
				{
					equip_amulets[i] = amulets[_index];
					amulets[_index].equip();
					amulets[_index].property(player);
					return true;
				}
			}
		}
		else
		{
			for (var i = 0; i < max_cells_amulets; i++)
			{
				if (equip_amulets[i] == amulets[_index])
				{
					equip_amulets[i].equip();
					equip_amulets[i].disable_property(player);
					equip_amulets[i] = undefined;
					return true;
				}
			}
		}
		return false;
	}
	
	unequip_emulet = function(_index)
	{
		if (equip_amulets[_index] != undefined)
		{
			equip_amulets[_index].equip();
			equip_amulets[_index].disable_property(player);
			equip_amulets[_index] = undefined;
		}
	}
	
	add_item = function(_item)
	{
		array_push(items, _item);
	}
	
	buy_item = function(_item)
	{
		if (player.moneys >= _item.price)
		{
			player.moneys -= _item.price;
			add(_item);
			return true;
		}
		else
			return false;
	}
	
	buy_amulet = function(_amulet)
	{
		if (player.moneys >= _amulet.price)
		{
			player.moneys -= _amulet.price;
			add_amulet(_amulet);
			return true;
		}
		else
			return false;
	}
	
	buy_cell = function(_price)
	{
		if (player.moneys >= _price)
		{
			player.moneys -= _price;
			add_new_cell();
			return true;
		}
		else
			return false;
	}
}