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
	description = "Амулет, увеличивающий вашу силу урона мечом.";
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
	hp_bonus = 20;
	
	property = function(_player)
	{
		_player.increase_maxHp(hp_bonus);
	}
	
	disable_property = function(_player)
	{
		_player.decrease_maxHp(hp_bonus);
	}
}

function AmuletTripleJump() : AAmulet() constructor
{
	name = "Тройной прыжок";
	description = "Этот амулет позволит вам прагнуть в воздухе два раза, прежде чем упасть на землю.";
	sprite = spr_amulet_tripleJump;
	jump_bonus = 1;
	
	property = function(_player)
	{
		_player.max_jumps += jump_bonus;
	}
	
	disable_property = function(_player)
	{
		_player.max_jumps -= jump_bonus;
	}
}

function AmuletResistence() : AAmulet() constructor
{
	name = "Слабое сопротивление урону";
	description = "Этот амулет уменьшает весь входящий по вам урон на 10%.";
	sprite = spr_amulet_resistence;
	resistance_bonus = 10;
	
	property = function(_player)
	{
		_player.resistance_percent += resistance_bonus;
	}
	
	disable_property = function(_player)
	{
		if (_player.resistance_percent - resistance_bonus >= 0)
			_player.resistance_percent -= resistance_bonus;
	}
}