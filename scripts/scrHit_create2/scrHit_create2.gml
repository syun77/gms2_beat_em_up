var type = argument0; // eAttackType
var px   = argument1; // position x
var py   = argument2; // position y
var pz   = argument3; // position z
var dir  = argument4; // dir
var side = argument5; // side

var inst = instance_create_depth(px, py, 0, objHit);
with(inst) {
	inst.type = type;
	inst.z = pz;
	inst.sprite_index = scrAttack_get(type, eAttackProperties.HitSprite);
	inst.side = eSide.Player;
	inst.alarm[0] = scrAttack_get(type, eAttackProperties.ActiveFrame);
	inst.dir = dir;
	if(dir == eDir.Left) {
		// Flip collision mask.
		inst.image_xscale = -1;
	}
}

return inst;
