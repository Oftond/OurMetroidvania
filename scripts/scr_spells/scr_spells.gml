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
	need_mana = 0;
	
	cast = function(_player) {}
	
	equip = function()
	{
		is_equipped = !is_equipped;
	}
}

function FireBall() : ASpell() constructor
{
	name = "Огненный шар";
	sprite_spell = spr_spell_fireBall;
	sprite_spell_destroy = spr_spell_fireBall_destroy;
	icon = spr_spell_fireBall_icon;
	is_equipped = false;
	need_mana = 2;
	damage = 5;
	spd_spell = 5;
	description = $"Создает огненный шар, летящий в сторону ваших недругов. Требует {need_mana} маны.";
	
	cast = function(_player)
	{
		if (_player.current_mana >= need_mana)
		{
			with (instance_create_depth(_player.bbox_right, _player.y - 50, -99, obj_spell))
			{
				damage = other.damage;
				sprite_destroy = other.sprite_spell_destroy;
				sprite_index = other.sprite_spell;
				image_index = 0;
				speed = other.spd_spell * sign(_player.image_xscale);
				_player.current_mana -= other.need_mana;
			}
		}
	}
}

function FireBorn() : ASpell() constructor
{
	name = "Адское пламя";
	icon = spr_spell_fireBorn_icon;
	is_equipped = false;
	need_mana = 4;
	description = $"Создает на ваших ладонях адское пламя, которое не причинит вам вреда, но испепелит до тла ваших врагов. Требует {need_mana} маны. Оно холодное...";
	
	cast = function(_player)
	{
		
	}
}

function WindTornado() : ASpell() constructor
{
	name = "Торнадо";
	icon = spr_spell_windTornado_icon;
	is_equipped = false;
	need_mana = 1;
	description = $"Призывает торнадо, замедляющее ваших врагов. Требует {need_mana} маны.";
	
	cast = function(_player)
	{
		
	}
}

function Heal() : ASpell() constructor
{
	name = "Малое лечение";
	icon = spr_spell_heal_icon;
	is_equipped = false;
	need_mana = 1;
	bonus_hp = 1;
	description = $"Исцеляет ваши раны. Требует {need_mana} маны.";
	
	cast = function(_player)
	{
		if (_player.current_mana >= need_mana)
		{
			_player.current_hp += bonus_hp;
			if (_player.current_hp > _player.max_hp)
				_player.current_hp = _player.max_hp;
			_player.current_mana -= need_mana;
			part_particles_create(Ps_Increase_Hearts, global.CameraWidth / 2, global.CameraHeight / 2, 1);
		}
	}
}