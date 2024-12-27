for (var i = 0; i < count_coin_drop; i++)
{
	var _offset = irandom_range(-30, 30);
	instance_create_depth(x + _offset,y,depth,obj_coin);
}
var _offset = irandom_range(-30, 30);
instance_create_depth(x + _offset,y,depth,obj_solid_mana);