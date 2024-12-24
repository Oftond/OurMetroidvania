var _current_room = ds_map_find_value(global.WorldMap, room_get_name(room));
_current_room.width = room_width * 0.1;
_current_room.height = room_height * 0.1;