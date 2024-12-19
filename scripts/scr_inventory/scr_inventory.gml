function Inventory(_player) constructor
{
	player = _player;
	max_items = 10;
	items = [];
	amulets = [];
	equip_amulets = [];
	cells_equip_amulets = 3;
	
	is_amulet_index = function(_index)
	{
		if (_index >= 0 && _index < array_length(amulets))
		{
			return true;
		}
		return false;
	}
	
	add_amulet = function(_amulet)
	{
		array_push(amulets, _amulet);
	}
	
	equip_emulet = function(_amulet)
	{
		
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
	
	remove = function(_index)
	{
		array_delete(items, _index, 1);
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