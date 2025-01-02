global.keyboard_hints = ds_map_create();
global.sony_hints = ds_map_create();
global.xbox_hints = ds_map_create();
global.current_hints = ds_map_create();

function GetGamepadHints()
{
	if (global.gamepad_name == Gamepades.Sony)
		return global.sony_hints;
	else if (global.gamepad_name == Gamepades.Xbox)
		return global.xbox_hints;
}

#region hints_binds
BindHints(global.keyboard_hints, Input.accept, spr_input_keyboard_enter);
BindHints(global.keyboard_hints, Input.next_page, spr_input_keyboard_e);
BindHints(global.keyboard_hints, Input.previous_page, spr_input_keyboard_q);
BindHints(global.keyboard_hints, Input.up, spr_input_keyboard_up);
BindHints(global.keyboard_hints, Input.down, spr_input_keyboard_down);
BindHints(global.keyboard_hints, Input.right, spr_input_keyboard_right);
BindHints(global.keyboard_hints, Input.left, spr_input_keyboard_left);
BindHints(global.keyboard_hints, Input.move, spr_input_keyboard_arrows);

BindHints(global.sony_hints, Input.accept, spr_input_gamepad_cross);
BindHints(global.sony_hints, Input.next_page, spr_input_gamepad_R1);
BindHints(global.sony_hints, Input.previous_page, spr_input_gamepad_L1);
BindHints(global.sony_hints, Input.up, spr_input_gamepad_up);
BindHints(global.sony_hints, Input.down, spr_input_gamepad_down);
BindHints(global.sony_hints, Input.right, spr_input_gamepad_right);
BindHints(global.sony_hints, Input.left, spr_input_gamepad_left);
BindHints(global.sony_hints, Input.move, spr_input_gamepad_stick);

BindHints(global.xbox_hints, Input.accept, spr_input_gamepad_A);
BindHints(global.xbox_hints, Input.next_page, spr_input_gamepad_RB);
BindHints(global.xbox_hints, Input.previous_page, spr_input_gamepad_LB);
BindHints(global.xbox_hints, Input.up, spr_input_gamepad_up);
BindHints(global.xbox_hints, Input.down, spr_input_gamepad_down);
BindHints(global.xbox_hints, Input.right, spr_input_gamepad_right);
BindHints(global.xbox_hints, Input.left, spr_input_gamepad_left);
BindHints(global.xbox_hints, Input.move, spr_input_gamepad_stick);

global.current_hints = global.keyboard_hints;
#endregion

function GetHint(_action)
{
	return ds_map_find_value(global.current_hints, _action);
}

function SetCurrentHints(_check_keyboard, _check_gamepad)
{
	if (_check_keyboard && global.current_hints != global.keyboard_hints)
		global.current_hints = global.keyboard_hints;
	else if (_check_gamepad && global.current_hints != GetGamepadHints())
		global.current_hints = GetGamepadHints();
}

function BindHints(_device, _action, _icon)
{
	if (is_undefined(ds_map_find_value(_device, _action)))
	{
		ds_map_add(_device, _action, _icon);
	}
	else
	{
		ds_map_replace(_device, _action, _icon);
	}
}