function Skills(_player) constructor
{
	skills = [];
	player = _player;
	
	try_add_skill = function(_skill)
	{
		if (player.current_level >= _skill.levels)
		{
			player.current_level -= _skill.levels;
			player.exp_to_level -= player.exp_to_level * (player.current_level);
			array_push(skills, _skill);
			show_message("Добавлено!")
			return true;
		}
		show_message("Не добавлено!")
		return false;
	}
}

global.Fair =
{
	levels : 1
}

global.Frozen =
{
	levels : 2
}