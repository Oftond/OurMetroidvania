/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
with(instance_create_depth(x,y,depth-1,obj_death2))
{
	sprite_index=other.death;
	image_index=other.image_index;
}
instance_create_depth(x,y,depth,obj_solid_mana);
instance_create_depth(x,y,depth,obj_coin);