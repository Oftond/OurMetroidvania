function Inventory(_player) constructor
{
	player = _player;
	max_items = 10;
	items = array_create(max_items);
	
	add = function(_item)
	{
		array_push(items, _item);
	}
	
	remove = function(_index)
	{
		array_delete(items, _index, 1);
	}
	
	buy = function(_item)
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