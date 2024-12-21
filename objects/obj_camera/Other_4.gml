var _target_x = follow.x - (global.CameraWidth / 2);
var _target_y = follow.y - (global.CameraHeight / 2);

_target_x = clamp(_target_x, 0, room_width - global.CameraWidth);
_target_y = clamp(_target_y, 0, room_height - global.CameraHeight);

finale_cam_x = _target_x;
finale_cam_y = _target_y;