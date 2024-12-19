function Inventory(_player) constructor
{
	player = _player;
	max_items = 10;
	items = [];
	amulets = [];
	equip_amulets = [];
	cells_equip_amulets = 3;
	
	is_amulet_index = function(_where, _index)
	{
		if (_index >= 0 && _index < array_length(_where))
			return true;
		return false;
	}
	
	add_amulet = function(_amulet)
	{
		array_push(amulets, _amulet);
	}
	
	equip_emulet = function(_index)
	{
		amulets[_index].property(player);
		array_push(equip_amulets, amulets[_index]);
		amulets[_index].equip();
	}
	
	unequip_emulet = function(_where, _index)
	{
		amulets[_index].equip();
		array_delete(_where, _index, 1);
		amulets[_index].disable_property(player);
	}
	
	add_item = function(_item)
	{
		if (array_length(items) < max_items)
		{
			array_push(items, _item);
			return true;
		}
		else
			return false;
	}
	
	buy_item = function(_item)
	{
		if (player.moneys >= _item.price)
		{
			add(_item);
			return true;
		}
		else
			return false;
	}
}