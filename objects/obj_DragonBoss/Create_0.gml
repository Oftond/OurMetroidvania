/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
// Inherit the parent event
event_inherited();
hp=5000;

attackBreathe=spr_DragonBoss_breathAttack_Mask;
attackTaile=spr_DragonBoss_tailAttack;
idle=spr_DragonBoss_idle;
move=spr_DragonBoss_idle;
fall=spr_DragonBoss_idle;
jump=spr_DragonBoss_idle;

Attacks=[{name:"breath",damage:70,animation:attackBreathe},{name:"hit",damage:50,animation:attackTaile}];