collision_wall = layer_tilemap_get_id("CollisionTiles");

global.CameraWidth = camera_get_view_width(view_camera[0]);
global.CameraHeight = camera_get_view_height(view_camera[0]);

instance_create_depth(x, y, depth, obj_camera);

global.font_main = font_add_sprite_ext(spr_dialogue_font_0, "_!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^`abcdefghijklmnopqrstuvwxyz\\{|}~АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя ", true, 5);