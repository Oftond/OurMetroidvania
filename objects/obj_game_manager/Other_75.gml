if(gamepad_is_supported())
{
	global.gamepad_name = GamepadGetType();
	SetCurrentHints(false, true);
}