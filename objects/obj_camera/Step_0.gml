if (obj_player.inventory_id != undefined)
	exit;

var _target_x = follow.x - (global.CameraWidth / 2);
var _target_y = follow.y - (global.CameraHeight / 2);

_target_x = clamp(_target_x, 0, room_width - global.CameraWidth);
_target_y = clamp(_target_y, 0, room_height - global.CameraHeight);

finale_cam_x += (_target_x - finale_cam_x) * cam_spd;
finale_cam_y += (_target_y - finale_cam_y) * cam_spd;

camera_set_view_pos(view_camera[0], finale_cam_x, finale_cam_y)

var _super_near = layer_get_id("Backgrounds_5");
var _near = layer_get_id("Backgrounds_4");
var _still_near = layer_get_id("Backgrounds_3");
var _distant = layer_get_id("Backgrounds_2");
var _for_away = layer_get_id("Backgrounds_1");

layer_x(_super_near, lerp(0, camera_get_view_x(view_camera[0]), 0.5));
layer_x(_near, lerp(0, camera_get_view_x(view_camera[0]), 0.5));
layer_x(_still_near, lerp(0, camera_get_view_x(view_camera[0]), 1));
layer_x(_distant, lerp(0, camera_get_view_x(view_camera[0]), 1));
layer_x(_for_away, lerp(0, camera_get_view_x(view_camera[0]), 0.970));