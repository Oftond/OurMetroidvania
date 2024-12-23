function Spells(_player) constructor
{
	max_number_spells = 8;
	spells = array_create(max_number_spells, undefined);
	max_equip_spells = 3;
	equip_spells = array_create(max_equip_spells, undefined);
	player = _player;
	
	add_spell = function(_spell)
	{
		for (var i = 0; i < max_number_spells; i++)
		{
			if (spells[i] == undefined)
			{
				spells[i] = _spell;
				return true;
			}
		}
		return false;
	}
	
	equip_spell = function(_index)
	{
		if (!spells[_index].is_equipped)
		{
			for (var i = 0; i < max_equip_spells; i++)
			{
				if (equip_spells[i] == undefined)
				{
					equip_spells[i] = spells[_index];
					spells[_index].equip();
					return true;
				}
			}
		}
		else
		{
			for (var i = 0; i < max_equip_spells; i++)
			{
				if (equip_spells[i] == spells[_index])
				{
					equip_spells[i].equip();
					equip_spells[i] = undefined;
					return true;
				}
			}
		}
		return false;
	}
}

function ASpell() constructor
{
	name = "";
	description = "";
	icon = undefined;
	is_equipped = false;
	
	cast = function(_player) {}
	
	equip = function()
	{
		is_equipped = !is_equipped;
	}
}

function FireBall() : ASpell() constructor
{
	name = "Огненный шар";
	description = "Создает огненный шар, летящий в сторону ваших недругов.";
	icon = spr_spell_fireBall_icon;
	is_equipped = false;
	
	cast = function(_player)
	{
		
	}
}

function FireBorn() : ASpell() constructor
{
	name = "Адское пламя";
	description = "Создает на ваших ладонях адское пламя, которое не причинит вам вреда, но испепелит до тла ваших врагов. Оно холодное...";
	icon = spr_spell_fireBorn_icon;
	is_equipped = false;
	
	cast = function(_player)
	{
		
	}
}

function WindTornado() : ASpell() constructor
{
	name = "Торнадо";
	description = "Призывает торнадо, замедляющее ваших врагов";
	icon = spr_spell_windTornado_icon;
	is_equipped = false;
	
	cast = function(_player)
	{
		
	}
}