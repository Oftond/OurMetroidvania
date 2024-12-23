function AAmulet() constructor
{
	name = "";
	description = "";
	sprite = undefined;
	is_equipped = false;
	
	property = function(_player) { }
	
	disable_property = function() { }
	
	equip = function()
	{
		is_equipped = !is_equipped;
	}
}

function AmuletFlashing() : AAmulet() constructor
{
	name = "Амулет причастия";
	description = "Этот амулет увеличит ваше время неуязвимости после получения урона.";
	sprite = spr_amulet_flashing;
}

function AmuletPowerOfGod() : AAmulet() constructor
{
	name = "Амулет божественной силы";
	description = "Амулет, увеличивающий вашу силу урона.";
	sprite = spr_amulet_powerOfGod;
	damage_bonus = 5;
	
	property = function(_player)
	{
		_player.sword.damage += damage_bonus;
	}
	
	disable_property = function(_player)
	{
		_player.sword.damage -= damage_bonus;
	}
}

function AmuletHeavyLunge() : AAmulet() constructor
{
	name = "Тяжелый выпад";
	description = "Амулет увеличит ваше максимальное здоровье.";
	sprite = spr_amulet_heavy_lunge;
	hp_bonus = 5;
	
	property = function(_player)
	{
		_player.max_hp += hp_bonus;
	}
	
	disable_property = function(_player)
	{
		_player.max_hp -= hp_bonus;
	}
}