function Spells(_player) constructor
{
	spells = [];
	equip_spell = [];
	max_equip_spells = 3;
	player = _player;
	
	add_skill = function(_spell)
	{
		array_push(spells, _spell);
		equip_spell(_spell);
	}
	
	equip_spell = function(spell)
	{
		if (array_length(equip_spell) < max_equip_spells)
		{
			array_push(equip_spell, _spell);
			return true;
		}
		return false;
	}
}