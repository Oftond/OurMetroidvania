level_1 =
{
	name : room_get_name(rm_level_1),
	width : 0,
	height : 0,
	x : -50,
	y : -20
}

level_2 =
{
	name : room_get_name(rm_level_2),
	width : 0,
	height : 0,
	x : -50,
	y : 0
}

level_3 =
{
	name : room_get_name(rm_level_3),
	width : 0,
	height : 0,
	x : 100,
	y : 100
}

level_4 =
{
	name : room_get_name(rm_forest),
	width : 0,
	height : 0,
	x : 0,
	y : 0
}

level_5 =
{
	name : room_get_name(rm_forest2),
	width : 0,
	height : 0,
	x : 0,
	y : 0
}

level_6 =
{
	name : room_get_name(rm_dungeon),
	width : 0,
	height : 0,
	x : 0,
	y : 0
}

level_7 =
{
	name : room_get_name(rm_first_boss),
	width : 0,
	height : 0,
	x : 0,
	y : 0
}

global.WorldMap = ds_map_create();

ds_map_add(global.WorldMap, level_1.name, level_1);
ds_map_add(global.WorldMap, level_2.name, level_2);
ds_map_add(global.WorldMap, level_3.name, level_3);
ds_map_add(global.WorldMap, level_4.name, level_4);
ds_map_add(global.WorldMap, level_5.name, level_5);
ds_map_add(global.WorldMap, level_6.name, level_6);
ds_map_add(global.WorldMap, level_7.name, level_7);

function minimap_draw()
{
	var _keys = ds_map_keys_to_array(global.WorldMap);
	for (var i = 0; i < array_length(_keys); i++)
	{
		var _room_name = _keys[i];
		var _room = ds_map_find_value(global.WorldMap, _room_name);
		var _x_offset = _room.x;
		var _y_offset = _room.y;
		draw_set_color(c_blue);
		draw_rectangle(obj_inventory.x + _x_offset, obj_inventory.y + _y_offset, obj_inventory.x + _x_offset + _room.width, obj_inventory.y + _y_offset + _room.height, false);
		if (_room_name == room_get_name(room))
		{
			draw_set_color(c_black);
			draw_circle(obj_inventory.x + _x_offset + (_room.width / 2), obj_inventory.y + _y_offset + (_room.height / 2), 30, false);
		}
	}
	draw_set_color(c_white);
}