enum Languages
{
	Ru,
	Eng
}

global.CurrentLanguage = Languages.Eng;

///Управление всей логикой системы локализации.
function LocalLanguages() constructor
{	
	global.LanguageEng = { };
	global.LanguageRus = { };
	
	///Метод для считывания данных из файла с английской
	///локализацией формата json. После чего, вернет все
	///считанные данные. Если файл не был найден,
	///выкинет исключение.
	///@return {Any}
	FileOpenEng = function()
	{
		if (file_exists("locale_en.json"))
		{
			var _file = file_text_open_read("locale_en.json");
			var _json = "";
			while(!file_text_eof(_file))
			{
				_json += file_text_readln(_file);
			}
			file_text_close(_file);
			var _result = json_parse(_json);
			return _result;
		}
		else
		{
			throw("Locale file not found");
		}
	}
	
	///Метод для считывания данных из файла с русской
	///локализацией формата json. После чего, вернет все
	///считанные данные. Если файл не был найден,
	///выкинет исключение.
	///@return {Any}
	FileOpenRus = function()
	{
		if (file_exists("locale_ru.json"))
		{
			var _file = file_text_open_read("locale_ru.json");
			var _json = "";
			while(!file_text_eof(_file))
			{
				_json += file_text_readln(_file);
			}
			file_text_close(_file);
			var _result = json_parse(_json);
			return _result;
		}
		else
		{
			throw("Locale file not found");
		}
	}
	
	///Метод, возвращающий все локализованные фразы из файла
	///на конкретном языке.
	///@param {constant.Languages} _language Язык локализации
	GetLocale = function(_language)
	{
		switch(_language)
		{
			case Languages.Ru:
				return global.LanguageRus;
				
			case Languages.Eng:
				return global.LanguageEng;
		}
		return global.LanguageEng;
	}
	
	global.LanguageEng = FileOpenEng();
	global.LanguageRus = FileOpenRus();
}

///Менеджер, управляющий локализацией.
function LanguageManager() constructor
{
	locale_languages = new LocalLanguages();
	current_language = { };

	///Метод, устанавливающий язык для локализации
	///@param {constant.Languages} _language Язык локализации
	SetLocale = function(_language)
	{
		current_language = locale_languages.GetLocale(_language);
		global.CurrentLanguage = _language;
	}

	///Метод, для получения локализованной фразы из словаря
	///по ключу. Выкинет исключение, если фраза не найдена.
	///@param {string} _key Ключ нужной фразы
	///@return {string}
	GetText = function(_key)
	{
		if (variable_struct_exists(current_language, _key))
		{
			var _result = variable_struct_get(current_language, _key);
			return _result;
		}
		else
		{
			throw("Phrase not found");
		}
	}
}

global.LanguageManager = new LanguageManager();
global.LanguageManager.SetLocale(global.CurrentLanguage);

//show_message(global.LanguageManager.GetText("HiImFine"));