function AAmulet() constructor
{
	name = "Амулет";
	sprite = undefined;
	
	property = function() { }
}

function AmuletFlashing() : AAmulet() constructor
{
	name = "Амулет причастия";
	sprite = spr_amulet_flashing;
	
	property = function() { }
}

function AmuletPowerOfGod() : AAmulet() constructor
{
	name = "Амулет божественной силы";
	sprite = spr_amulet_up_attack;
	
	property = function() { }
}