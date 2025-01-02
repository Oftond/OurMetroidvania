function InputPressed(_action)
{
	gamepad_set_button_threshold(GamepadGetSlot(), 0.6);
	var _key_keyboard = ds_map_find_value(global.keyboard, _action);
	var _key_gamepad = ds_map_find_value(global.gamepad, _action);
	var _result_keyboard = global.devices[Devices.keyboard].CheckPressed(_key_keyboard);
	var _result_gamepad = global.devices[Devices.gamepad].CheckPressed(_key_gamepad);
	
	if (_result_keyboard || _result_gamepad)
	{
		SetCurrentHints(_result_keyboard, _result_gamepad);
		return true;
	}
	else
	{
		return false;
	}
}

function InputHeld(_action)
{
	gamepad_set_button_threshold(GamepadGetSlot(), 0.1);
	var _key_keyboard = ds_map_find_value(global.keyboard, _action);
	var _key_gamepad = ds_map_find_value(global.gamepad, _action);
	var _result_keyboard = global.devices[Devices.keyboard].CheckHeld(_key_keyboard);
	var _result_gamepad = global.devices[Devices.gamepad].CheckHeld(_key_gamepad);
	
	if (_result_keyboard || _result_gamepad)
	{
		return true;
	}
	else
	{
		return false;
	}
}

function InputReleased(_action)
{
	gamepad_set_button_threshold(GamepadGetSlot(), 0.1);
	var _key_keyboard = ds_map_find_value(global.keyboard, _action);
	var _key_gamepad = ds_map_find_value(global.gamepad, _action);
	var _result_keyboard =  global.devices[Devices.keyboard].CheckReleased(_key_keyboard);
	var _result_gamepad = global.devices[Devices.gamepad].CheckReleased(_key_gamepad);
	
	if (_result_keyboard || _result_gamepad)
	{
		return true;
	}
	else
	{
		return false;
	}
}

function InputStickHorizontalPressed()
{
	static _stick_dely = 0;
	gamepad_set_axis_deadzone(GamepadGetSlot(), 0.3);
	var _horizontal = global.gamepadstick.AxisHorizontal();
	if (_stick_dely == 0)
	{
		_stick_dely = 10;
		return round(_horizontal);
	}
	else
	{
		_stick_dely--;
		return 0;
	}
}

function InputStickVerticalPressed()
{
	static _stick_dely = 0;
	gamepad_set_axis_deadzone(GamepadGetSlot(), 0.3);
	var _vertical = global.gamepadstick.AxisVertical();
	if (_vertical != 0)
	{
		if (_vertical == 0)
		{
			_stick_dely = 0;
		}
		if (_stick_dely == 0)
		{
			_stick_dely = 6;
			return round(_vertical);
		}
		else
		{
			_stick_dely--;
			return 0;
		}
	}
	else
	{
		_stick_dely = 0;
		return 0;
	}
}

function InputStickHorizontalHeld()
{
	gamepad_set_axis_deadzone(GamepadGetSlot(), 0.4);
	var _horizontal = global.gamepadstick.AxisHorizontal();
	return round(_horizontal);
}

function InputStickVerticalHeld()
{
	gamepad_set_axis_deadzone(GamepadGetSlot(), 0.4);
	var _vertical = global.gamepadstick.AxisVertical();
	return round(_vertical);
}