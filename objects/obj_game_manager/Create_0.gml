collision_wall = obj_wall;

global.CameraWidth = camera_get_view_width(view_camera[0]);
global.CameraHeight = camera_get_view_height(view_camera[0]);

instance_create_depth(x, y, depth, obj_camera);