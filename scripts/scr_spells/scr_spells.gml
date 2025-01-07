function Spells() constructor
{
	max_number_spells = 8;
	spells = array_create(max_number_spells, undefined);
	max_equip_spells = 3;
	equip_spells = array_create(max_equip_spells, undefined);
	
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
	need_mana = 30;
	damage = 15;
	spd_spell = 10;
	description = $"Создает огненный шар, летящий в сторону ваших недругов. Требует {need_mana} маны.";
	
	cast = function(_player)
	{
		if (_player.spend_mana(need_mana))
		{
			with (instance_create_layer(_player.x + (68 * sign(_player.image_xscale)), _player.y - 65, "GUI", obj_spell))
			{
				image_xscale = _player.image_xscale;
				damage = other.damage;
				sprite_destroy = other.sprite_spell_destroy;
				sprite_index = other.sprite_spell;
				image_index = 0;
				speed = other.spd_spell * sign(_player.image_xscale);
			}
			var _parts = part_system_create_layer("GUI", false, Ps_Explosion_Magic)
			part_system_position(_parts, _player.x + (50 * sign(_player.image_xscale)), _player.y - 65);
		}
	}
}

function FireBorn() : ASpell() constructor
{
	name = "Адское пламя";
	icon = spr_spell_fireBorn_icon;
	is_equipped = false;
	need_mana = 20;
	description = $"Создает на ваших ладонях адское пламя, которое не причинит вам вреда, но испепелит до тла ваших врагов. Требует {need_mana} маны. Оно холодное...";
	sprite_spell = spr_spell_fireBorn;
	damage = 30;
	
	cast = function(_player)
	{
		if (_player.spend_mana(need_mana))
		{
			with (instance_create_layer(_player.x + (68 * sign(_player.image_xscale)), _player.y - 65, "GUI", obj_spell))
			{
				can_destroy = false;
				sprite_index = other.sprite_spell;
				image_index = 0;
				damage = other.damage;
			}
		}
	}
}

function WindTornado() : ASpell() constructor
{
	name = "Торнадо";
	icon = spr_spell_windTornado_icon;
	is_equipped = false;
	need_mana = 10;
	description = $"Призывает торнадо, замедляющее ваших врагов. Требует {need_mana} маны.";
	move_slow = 1;
	spd_spell = 5;
	sprite_spell = spr_spell_windTornado;
	sprite_spell_destroy = spr_spell_windTornado_destroy;
	
	cast = function(_player)
	{
		if (_player.spend_mana(need_mana))
		{
			with (instance_create_layer(_player.bbox_right, _player.bbox_bottom, "GUI", obj_spell))
			{
				image_xscale = _player.image_xscale;
				move_slow = other.move_slow;
				sprite_destroy = other.sprite_spell_destroy;
				sprite_index = other.sprite_spell;
				image_index = 0;
				speed = other.spd_spell * sign(_player.image_xscale);
			}
			var _parts = part_system_create_layer("GUI", false, Ps_Explosion_Magic)
			part_system_position(_parts, _player.x + 35, _player.y - 40);
		}
	}
}

function Heal() : ASpell() constructor
{
	name = "Малое лечение";
	icon = spr_spell_heal_icon;
	is_equipped = false;
	need_mana = 5;
	bonus_hp = 10;
	description = $"Исцеляет ваши раны. Требует {need_mana} маны.";
	
	cast = function(_player)
	{
		if (_player.spend_mana(need_mana))
		{
			_player.heal(bonus_hp);
			var _parts = part_system_create_layer("GUI", false, Ps_Increase_Hearts)
			part_system_position(_parts, _player.x, _player.y - 20);
		}
	}
}