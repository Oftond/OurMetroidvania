enum STATES
{
	IDLE,
	ATTACK,
	MAGIC_ATTACK,
	JUMP,
	WALL_JUMP,
	DASH,
	HIT,
	WALK,
	FALL,
	DOUBLE_JUMP,
	CAST_SPELL,
	DEATH
}

enum TYPESITEMS
{
	ITEM,
	AMULET,
	CELL,
	HEALTH,
	MANA
}

enum LANGUAGES
{
	RUS,
	ENG
}

global.Headings = fnt_headings;
global.SubHeadings = fnt_subheadings;
global.Description = fnt_description;
global.Tips = fnt_tips;
global.Language = LANGUAGES.RUS;