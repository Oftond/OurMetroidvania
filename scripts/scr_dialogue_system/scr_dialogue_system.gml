enum CharactersName
{
	sardar = 1,
	protagonist,
	protagonist_smile,
}

enum Situations
{
	place_1 = 1,
	place_2,
	place_3,
	
	answer_1,
	answer_2,
	answer_3,
}

///Эта функция устанавливает выбор для игрока, который ему
///нужно сделать.
///@param {string} _choice Один из фариантов ответа на вопрос
///@param {constant.Situations} _answer Ответ, определяющий, какая
///ситуация должна произойти пре выборе данного ответа
///@param {constant.CharactersName} _character Имя персонажа, задавшего вопрос
function ChoiceSet(_choice, _answer, _character)
{
	choice[choice_qty] = _choice;
	answer[choice_qty] = _answer;
	who_is_speaked[choice_qty] = _character;
	choice_qty++;
}

///Эта функция начинает диалог, создав объект диалогового окна.
///@param {constant.CharactersName} _character_name Имя существующего
///персонажа, который начинает диалог
///@param {constant.Situations} _situation Ситуация, в которой начинается
///диалог
function DialogueStart(_character_name, _situation)
{
	with (instance_create_depth(0, 0, 0, obj_textbox))
	{
		PhraseSet(_character_name, _situation);
	}
}

///С помощью этой функции можно добавить новую
///фразу для конкретного персонажа, установив для этой фразы
///голос персонажа при помощи его имени, либо же не устанавливать какой-либо голос.
///Тогда будет установлен голос по умолчанию.
///@param {string} _phrase Фраза для персонажа
///@param {constant.CharactersName} _name Имя для существующего персонажа, для
///установки голоса этой фразе
function PhraseAdd(_phrase)
{
	DialogueSettingsDefault()
	phrases[page_qty] = _phrase;
	
	if (argument_count > 1)
	{
		switch(argument[1])
		{
			case CharactersName.sardar:
				face_sprite[page_qty] = spr_face_sardar_0;
				snd[page_qty] = snd_sardar_voice;
			break;
			
			case CharactersName.protagonist:
				face_sprite[page_qty] = spr_face_protagonist_0;
				snd[page_qty] = snd_protagonist_voice;
			break;
			
			case CharactersName.protagonist_smile:
				face_sprite[page_qty] = spr_face_protagonist_smile_0;
				snd[page_qty] = snd_protagonist_voice;
			break;
		}
	}
	page_qty++;
}

///Эта функция устанавливает настройки диалоговой системы по
///умолчанию
function DialogueSettingsDefault()
{
	line_break_pos[0, page_qty] = 999
	line_break_default[page_qty] = 0;
	face_sprite[page_qty] = noone
	phrase_shift[page_qty] = 0
	snd[page_qty] = snd_type_voice;
	
	for (var i  = 0; i < 400; i ++)
	{
		color_1[i, page_qty] = c_white;
		color_2[i, page_qty] = c_white;
		color_3[i, page_qty] = c_white;
		color_4[i, page_qty] = c_white;
		
		wavy_words[i, page_qty] = 0;
		wavy_dir[i, page_qty] = i * 30;
		
		shake_chars[i, page_qty] = 0;
		shake_dir[i, page_qty] = irandom(360) * 2;
		shake_timer[i, page_qty] = irandom(12);
	}
}

///Эта функция устанавливает цвет для символов в определённом
///диапозоне в диалоге в текущей фразе.
///@param {real} _min Начальная позиция символа
///@param {real} _max Конечная позиция символа
///@param {constant.Color} _color_1 Цвет 1
///@param {constant.Color} _color_2 Цвет 2
///@param {constant.Color} _color_3 Цвет 3
///@param {constant.Color} _color_4 Цвет 4
function DialogueSetColor(_min, _max, _color_1, _color_2, _color_3, _color_4)
{
	for (var i  = _min; i <= _max; i++)
	{
	color_1[i, page_qty - 1] = _color_1;
	color_2[i, page_qty - 1] = _color_2;
	color_3[i, page_qty - 1] = _color_3;
	color_4[i, page_qty - 1] = _color_4;
	}
}

///Эта функция устанавливает эффект волн для символов в
///определённом диапозоне в диалоге в текущей фразе.
///@param {real} _min Начальная позиция символа
///@param {real} _max Конечная позиция символа
function DialogueSetFloat(_min, _max)
{
	for (var i = _min; i <= _max; i++)
	{
		wavy_words[i, page_qty - 1] = true;
	}
}

///Эта функция устанавливает эффект тряски для символов в
///определённом диапозоне в диалоге в текущей фразе.
///@param {real} _min Начальная позиция символа
///@param {real} _max Конечная позиция символа
function DialogueSetShake(_min, _max)
{
	for (var i = _min; i <= _max; i++)
	{
		shake_chars[i, page_qty - 1] = true;
	}
}

///Эта функция устанавливает все фразы для диалога
///определённым персонажем и в определенном месте. Эта функция
///используется для начала диалога с каким либо персонажем.
///@param {constant.CharactersName} _character_name Имя
///существующего персонажа
///@param {constant.Situations} _situation Ситуация, в которой происходит
///диалог
function PhraseSet(_character_name, _situation)
{
	switch(_character_name)
	{
		case CharactersName.sardar:
			switch(_situation)
			{
				case Situations.place_1:
					PhraseAdd("Здравствуй! Я в порядке, а ты как?", CharactersName.sardar);
					PhraseAdd("Я тоже в нормале. Рад, что ты цел.", CharactersName.protagonist);
					PhraseAdd("А ты просто отдыхал или что?", CharactersName.sardar);
					ChoiceSet("Были дела", Situations.answer_1, CharactersName.sardar);
					ChoiceSet("Да на днях я посуду разбил", Situations.answer_2, CharactersName.sardar);
				break;
				case Situations.answer_1:
					PhraseAdd("Я не люблю отвлекаться от своих дел.", CharactersName.protagonist);
					PhraseAdd("А ты вообще тупой!", CharactersName.protagonist);
				break;
				case Situations.answer_2:
					PhraseAdd("Я не очень-то аккуратен, и поэтому, разбил свою новую посуду...", CharactersName.protagonist_smile);
					PhraseAdd("Как и ты, я часто хожу в магазин с посудой, чтобы, ну, ты знаешь...", CharactersName.protagonist);
				break;
			}
			
		case CharactersName.protagonist:
			switch(_situation)
			{
				case Situations.place_2:
					PhraseAdd("Ну типа все дела сделаны...");
					PhraseAdd("А я крут!!!???");
				break;
			}
		break;
	}
}