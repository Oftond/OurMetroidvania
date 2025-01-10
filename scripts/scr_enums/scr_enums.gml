enum STATE
{
	move,
	attack,
	death,
	idle,
	hit,
	apear,
	defence,
	jump,
	fall,
	heal,
	dash,
	slide
}

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
	SPELL,
	CELL,
	HEALTH,
	MANA
}

enum LOOTTYPES
{
	COIN,
	MANA
}

enum LANGUAGES
{
	RUS,
	ENG
}

global.IsPause = false;
global.Headings = fnt_headings;
global.SubHeadings = fnt_subheadings;
global.Description = fnt_description;
global.Tips = fnt_tips;
global.Language = LANGUAGES.RUS;