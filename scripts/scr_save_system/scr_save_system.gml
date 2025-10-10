
global.VisitedRooms = ds_map_create();
global.AllSpells =
[
	new FireBall(),
	new FireBorn(),
	new WindTornado(),
	new Heal()
];
global.AllAmulets =
[
	new AmuletFlashing(),
	new AmuletPowerOfGod(),
	new AmuletHeavyLunge(),
	new AmuletTripleJump(),
	new AmuletResistence()
];

function FileManager() constructor
{
	WriteToFile = function(_content, _fileName, _fileEnding = ".json")
	{
		var _file = $"{_fileName}{_fileEnding}";
		var _content_encode = base64_encode(_content);
		var _buffer = buffer_create(string_byte_length(_content_encode) + 1, buffer_fixed, 1);
		buffer_write(_buffer, buffer_string, _content_encode);
		buffer_save(_buffer, _file);
		buffer_delete(_buffer);
	}
	
	ReadFromFile = function(_fileName, _fileEnding = ".json")
	{
		var _file = $"{_fileName}{_fileEnding}";
		if (!file_exists(_file))
			return "";
		var _buffer = buffer_load(_file);
		var _content = buffer_read(_buffer, buffer_string);
		var _content_result = base64_decode(_content);
		
		buffer_delete(_buffer);
		return _content_result;
	}
	
	DeleteFile = function(_fileName, _fileEnding = ".json")
	{
		var _file = $"{_fileName}{_fileEnding}";
		if (!file_exists(_file))
			return;
		file_delete(_file);
	}
}

function SaveSystem() constructor
{
	fileName = "FileName";
	
	Save = function()
	{ 
		var _file_manager = new FileManager();
		_file_manager.WriteToFile(GetData(), fileName, ".sav");
	}
	
	Load = function()
	{
		var _file_manager = new FileManager();
		SetData(_file_manager.ReadFromFile(fileName, ".sav")); 
	}
	
	Delete = function()
	{
		var _file_manager = new FileManager();
		_file_manager.DeleteFile(fileName)
	}
	
	GetData = function() { return "" }
	
	SetData = function(_data) { }
}

///Изменяемый класс, хранит в себе всю логику сохранений
///и загрузки файлов.
function GameManager() : SaveSystem() constructor
{
	fileName = "SaveFile_1";
	
	///Логика сохранения всех данных об игре
	GetData = function()
	{
		SaveRoom();
		var _rooms_arr = ds_map_values_to_array(global.VisitedRooms);
		var _player_struct =
		{
			player_max_hp : obj_player.max_hp,
			player_current_hp : obj_player.current_hp,
			player_max_mana : obj_player.max_mana,
			player_current_mana : obj_player.current_mana,
			player_spells : [],
			player_amulets : [],
			player_x : obj_player.x,
			player_y : obj_player.y,
			room_current : room,
			visited_rooms : _rooms_arr,
			player_x_checkpoint : obj_player.x_checkpoint,
			player_y_checkpoint : obj_player.y_checkpoint,
			player_room_to_respawn : obj_player.room_to_respawn
		}
		
		for (var i = 0; i < obj_player.spells.max_number_spells; i++)
		{
			if (obj_player.spells.spells[i] = undefined)
				break;

			var _spell_struct =
			{
				name : obj_player.spells.spells[i].name,
				is_equipped : obj_player.spells.spells[i].is_equipped
			};
			
			array_push(_player_struct.player_spells, _spell_struct);
		}
		
		for (var i = 0; i < obj_player.inventory.max_number_amulets; i++)
		{
			if (obj_player.inventory.amulets[i] = undefined)
				break;
				
			var _amulet_struct =
			{
				name : obj_player.inventory.amulets[i].name,
				is_equipped : obj_player.inventory.amulets[i].is_equipped
			};
			
			array_push(_player_struct.player_amulets, _amulet_struct);
		}
		
		return json_stringify(_player_struct);
	}
	
	///Логика загрузки всех данных об игре
	///@param _data Данные, полученные из файла
	SetData = function(_data)
	{
		if (_data == "")
		{
			room_goto(rm_forest);
			instance_create_layer(3560, 836, "Player", obj_player);
			return;
		}
		
		var _player_struct = json_parse(_data);
		
		
		room_goto(_player_struct.room_current);
		
		var _rooms_arr = _player_struct.visited_rooms;
		
		for (var i = 0; i < array_length(_rooms_arr); i++)
			ds_map_add(global.VisitedRooms, room_get_name(_rooms_arr[i].saveRoom), _rooms_arr[i]);
		
		if (instance_exists(obj_player))
			instance_destroy(obj_player);
			
		instance_create_layer(_player_struct.player_x, _player_struct.player_y, "Player", obj_player);
		
		obj_player.max_hp = _player_struct.player_max_hp;
		obj_player.current_hp = _player_struct.player_current_hp;
		obj_player.max_mana = _player_struct.player_max_mana;
		obj_player.current_mana = _player_struct.player_current_mana;
		obj_player.x_checkpoint = _player_struct.player_x_checkpoint;
		obj_player.y_checkpoint = _player_struct.player_y_checkpoint;
		obj_player.room_to_respawn = _player_struct.player_room_to_respawn;
		
		for (var i = 0; i < array_length(_player_struct.player_spells); i++)
		{
			for (var  j = 0; j < array_length(global.AllSpells); j++)
			{
				if (_player_struct.player_spells[i].name == global.AllSpells[j].name)
				{
					obj_player.spells.add_spell(variable_clone(global.AllSpells[j]));
					if (_player_struct.player_spells[i].is_equipped)
						obj_player.spells.equip_spell(i);
					break;
				}
			}
		}
		
		for (var i = 0; i < array_length(_player_struct.player_amulets); i++)
		{
			for (var  j = 0; j < array_length(global.AllAmulets); j++)
			{
				if (_player_struct.player_amulets[i].name == global.AllAmulets[j].name)
				{
					obj_player.inventory.add_amulet(variable_clone(global.AllAmulets[j]));
					if (_player_struct.player_amulets[i].is_equipped)
						obj_player.inventory.equip_emulet(i);
					break;
				}
			}
		}

		if (obj_player.current_hp <= 0)
		{
			room_goto(_player_struct.player_room_to_respawn);
			obj_player.x = _player_struct.player_x_checkpoint;
			obj_player.y = _player_struct.player_y_checkpoint;
			obj_player.heal(obj_player.max_hp);
			obj_player.get_mana(obj_player.max_mana);
		}
	}
}

function SaveRoom()
{
	var _room_struct =
	{
		saveRoom : room,
		chestNumber : instance_number(obj_chest),
		chests : array_create(instance_number(obj_chest), undefined),
		itemNumber : instance_number(obj_item),
		items : array_create(instance_number(obj_item), undefined)
	}

	for (var i = 0; i < _room_struct.chestNumber; i++)
	{
		var _chest = instance_find(obj_chest, i);
		
		var _chest_struct =
		{
			chest_is_open : _chest.is_open,
			chest_image_index : _chest.image_index,
			chest_image_speed : _chest.image_speed,
			chest_item_is_given : _chest.item_is_given,
			chest_type_item : _chest.type_item,
			chest_item_name : _chest.item.name,
			chest_mask_index : _chest.mask_index,
			x_pos : _chest.x,
			y_pos : _chest.y
		}
		
		_room_struct.chests[i] = _chest_struct;
	}
	
	for (var i = 0; i < _room_struct.itemNumber; i++)
	{
		var _item = instance_find(obj_item, i);
		var _item_struct =
		{
			item_type_item : _item.type_item,
			item_item : _item.item,
			item_depth : _item.depth,
			item_chest : _item.chest,
			x_pos : _item.chest.x - 5,
			y_pos : _item.chest.y
		}
		_room_struct.items[i] = _item_struct;
	}
	
	var _room_name = room_get_name(_room_struct.saveRoom);
	ds_map_set(global.VisitedRooms, _room_name, _room_struct);
}

function LoadRoom()
{
	var _room_name = room_get_name(room);
	var _room_load = ds_map_find_value(global.VisitedRooms, _room_name);
	if (is_undefined(_room_load))
		return;
	if (instance_exists(obj_chest))
		instance_destroy(obj_chest)
		
	if (instance_exists(obj_item))
		instance_destroy(obj_item)
	
	for (var i = 0; i < _room_load.chestNumber; i++)
	{
		with (instance_create_layer(_room_load.chests[i].x_pos, _room_load.chests[i].y_pos, "Environment", obj_chest))
		{
			mask_index = _room_load.chests[i].chest_mask_index;
			type_item = _room_load.chests[i].chest_type_item;
			if (type_item == TYPESITEMS.SPELL)
			{
				for (var  j = 0; j < array_length(global.AllSpells); j++)
				{
					if (_room_load.chests[i].chest_item_name == global.AllSpells[j].name)
					{
						item = variable_clone(global.AllSpells[j]);
					}
				}
			}
			else if (type_item == TYPESITEMS.AMULET)
			{
				for (var  j = 0; j < array_length(global.AllAmulets); j++)
				{
					if (_room_load.chests[i].chest_item_name == global.AllAmulets[j].name)
					{
						item = variable_clone(global.AllAmulets[j]);
					}
				}
			}
			image_speed = _room_load.chests[i].chest_image_speed;
			is_open = _room_load.chests[i].chest_is_open;
			item_is_given = _room_load.chests[i].chest_item_is_given;
			image_index = _room_load.chests[i].chest_image_index;
			image_speed = _room_load.chests[i].chest_image_speed;
		}
	}
	
	for (var i = 0; i < _room_load.itemNumber; i++)
	{
		with (instance_create_layer(_room_load.items[i].x_pos, _room_load.items[i].y_pos, "Environment", obj_item))
		{
			type_item = _room_load.items[i].item_type_item;
			item = _room_load.items[i].item_item;
			depth = _room_load.items[i].item_depth;
			chest = _room_load.items[i].item_chest;
			curvPosition = 1;
		}
	}
}

function RespawnPlayer()
{
	
}