global.keyboard = ds_map_create();
global.gamepad = ds_map_create();
global.hints = ds_map_create();
global.gamepad_name = noone;

global.devices = [new DeviceKeyboard(), new DeviceGamepad()];
global.gamepadstick = new GamepadLeftStick();

enum Input
{
	accept,
	back,
	down,
	up,
	left,
	right,
	jump,
	dash,
	attack,
	spell_1,
	spell_2,
	spell_3,
	inventory,
	run,
	fullscreen,
	next_page,
	previous_page
}

enum Devices
{
	keyboard,
	gamepad
}

enum Gamepades
{
	Sony,
	Xbox
}

#region input_binds
InputBind(global.keyboard, Input.accept, vk_enter);
InputBind(global.keyboard, Input.back, vk_shift);
InputBind(global.keyboard, Input.down, vk_down);
InputBind(global.keyboard, Input.up, vk_up);
InputBind(global.keyboard, Input.right, vk_right);
InputBind(global.keyboard, Input.left, vk_left);
InputBind(global.keyboard, Input.jump, "Z");
InputBind(global.keyboard, Input.dash, "C");
InputBind(global.keyboard, Input.attack, "X");
InputBind(global.keyboard, Input.spell_1, "A");
InputBind(global.keyboard, Input.spell_2, "S");
InputBind(global.keyboard, Input.spell_3, "D");
InputBind(global.keyboard, Input.inventory, vk_tab);
InputBind(global.keyboard, Input.fullscreen, vk_f5);
InputBind(global.keyboard, Input.next_page, "E");
InputBind(global.keyboard, Input.previous_page, "Q");

InputBind(global.gamepad, Input.accept, gp_face1);
InputBind(global.gamepad, Input.back, gp_face2);
InputBind(global.gamepad, Input.down, gp_padd);
InputBind(global.gamepad, Input.up, gp_padu);
InputBind(global.gamepad, Input.right, gp_padr);
InputBind(global.gamepad, Input.left, gp_padl);
InputBind(global.gamepad, Input.jump, gp_face1);
InputBind(global.gamepad, Input.dash, gp_shoulderrb);
InputBind(global.gamepad, Input.attack, gp_face3);
InputBind(global.gamepad, Input.spell_1, gp_shoulderr);
InputBind(global.gamepad, Input.spell_2, gp_shoulderl);
InputBind(global.gamepad, Input.spell_3, gp_shoulderlb);
InputBind(global.gamepad, Input.inventory, gp_start);
InputBind(global.gamepad, Input.fullscreen, vk_f5);
InputBind(global.gamepad, Input.next_page, gp_shoulderr);
InputBind(global.gamepad, Input.previous_page, gp_shoulderl);
#endregion

#region hints_binds

#endregion

function InputBind(_device, _action, _key)
{
	if (is_string(_key))
	{
		_key = ord(_key);
	}
	if (is_undefined(ds_map_find_value(_device, _action)))
	{
		ds_map_add(_device, _action, _key);
	}
	else
	{
		ds_map_replace(_device, _action, _key);
	}
}

function Device() constructor
{
	static CheckPressed = function(_key)
	{
		return false;
	}
	
	static CheckHeld = function(_key)
	{
		return false;
	}
	
	static CheckReleased = function(_key)
	{
		return false;
	}
}

function DeviceKeyboard() : Device() constructor
{
	static CheckPressed = function(_key)
	{
		return keyboard_check_pressed(_key);
	}
	
	static CheckHeld = function(_key)
	{
		return keyboard_check(_key);
	}
	
	static CheckReleased = function(_key)
	{
		return keyboard_check_released(_key);
	}
}

function DeviceGamepad() : Device() constructor
{
	static CheckPressed = function(_key)
	{
		return gamepad_button_check_pressed(GamepadGetSlot(), _key);
	}
	
	static CheckHeld = function(_key)
	{
		return gamepad_button_check(GamepadGetSlot(), _key);
	}
	
	static CheckReleased = function(_key)
	{
		return gamepad_button_check_released(GamepadGetSlot(), _key)
	}
}

function GamepadLeftStick() constructor
{	
	static AxisHorizontal = function()
	{
		gamepad_set_axis_deadzone(GamepadGetSlot(), 0.3);
		return gamepad_axis_value(GamepadGetSlot(), gp_axislh);
	}
	
	static AxisVertical = function()
	{
		gamepad_set_axis_deadzone(GamepadGetSlot(), 0.3);
		return gamepad_axis_value(GamepadGetSlot(), gp_axislv);
	}
}

function GamepadGetSlot()
{
	var gp_slots = gamepad_get_device_count();
	var gp_slot_on = -1;
	
	for (var i = 0; i < gp_slots; i++)
	{
		if (gamepad_is_connected(i))
		{
			gp_slot_on = i;
			break;
		}
		else
		{
			gp_slot_on = -1;
		}
	}
	
	return gp_slot_on;
}

function GamepadGetName()
{
	var gamepad_slot = GamepadGetSlot();
	var gamepad_description = gamepad_get_description(gamepad_slot);
	var gamepad_name = string_lower(gamepad_description);
	
	return gamepad_name;
}

function GamepadGetType()
{
	var gamepad_name = GamepadGetName();
	if (string_count("ps4", gamepad_name) || string_count("ps5", gamepad_name) || string_count("dualshock", gamepad_name) || string_count("dualsense", gamepad_name))
	{
		return Gamepades.Sony;
	} 
	else if (string_count("xbox", gamepad_name))
	{
		return Gamepades.Xbox;
	}
	else
	{
		return Gamepades.Xbox;
	}
}

function GetAnyGampadKey()
{
	gamepad_set_button_threshold(GamepadGetSlot(), 0.1);
	for (var i = gp_face1; i <= gp_axisrv; i++)
	{
		if (i < gp_shoulderlb)
		{
			if (gamepad_button_check(GamepadGetSlot(), i))
			{
				return true;
			}
		}
		else if (i >= gp_shoulderlb && i <= gp_shoulderrb)
		{
			if (gamepad_button_value(GamepadGetSlot(), i) > 0.5)
			{
				return true;
			}
		}
		else if (i >= gp_padu && i <= gp_padr)
		{
			if (gamepad_button_check(GamepadGetSlot(), i))
			{
				show_debug_message(i)
				return true;
			}
		}
	}
	return false;
}