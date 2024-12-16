/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
randomize()
// Inherit the parent event
event_inherited();
templateAtatacked=[];

attack=function(_character)
{
	var n=round(random(array_length(templateAtatacked)));
	templateAtatacked[n]();
}