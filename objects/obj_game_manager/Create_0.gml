if (instance_number(obj_game_manager) > 1)
	instance_destroy();

collision_wall = undefined;

global.CameraWidth = camera_get_view_width(view_camera[0]);
global.CameraHeight = camera_get_view_height(view_camera[0]);

instance_create_depth(x, y, depth, obj_camera);
instance_create_depth(x, y, depth, obj_show_status);

global.font_main = fnt_dialogue;

global.SaveSystemManager = new GameManager();

global.SaveSystemManager.Load();