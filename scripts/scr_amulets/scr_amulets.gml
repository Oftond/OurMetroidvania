function AAmulet() constructor
{
	name = "Амулет";
	sprite = undefined;
	is_equipped = false;
	
	property = function(_player) { }
	
	disable_property = function() { }
	
	equip = function()
	{
		show_message(12)
		is_equipped = !is_equipped;
	}
}

function AmuletFlashing() : AAmulet() constructor
{
	name = "Амулет причастия";
	sprite = spr_amulet_flashing;
	
	equip = function()
	{
		is_equipped = !is_equipped;
	}
}

function AmuletPowerOfGod() : AAmulet() constructor
{
	name = "Амулет божественной силы";
	sprite = spr_amulet_up_attack;
	damage_bonus = 5;
	
	equip = function()
	{
		is_equipped = !is_equipped;
	}
	
	property = function(_player)
	{
		_player.sword.damage += damage_bonus;
	}
	
	disable_property = function(_player)
	{
		_player.sword.damage -= damage_bonus;
	}
}