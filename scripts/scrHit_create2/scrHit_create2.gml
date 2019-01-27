var parent = argument0; // parent object.id
var type   = argument1; // eAttackType
var px     = argument2; // position x
var py     = argument3; // position y
var pz     = argument4; // position z
var dir    = argument5; // dir
var side   = argument6; // side

var inst = instance_create_depth(px, py, 0, objHit);
with(inst) {
	inst.parent_obj_id = parent;
	inst.type = type;
	inst.z = pz;
	inst.sprite_index = scrAttack_get(type, eAttackProperties.HitSprite);
	inst.side = side;
	inst.alarm[0] = scrAttack_get(type, eAttackProperties.ActiveFrame);
	inst.dir = dir;
	inst.hit_any = false;
	if(dir == eDir.Left) {
		// Flip collision mask.
		inst.image_xscale = -1;
	}
}

return inst;
