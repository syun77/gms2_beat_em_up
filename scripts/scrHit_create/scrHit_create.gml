/// scrHit_create(spr, px, py, pz, dir, side, timer_destroy, knockdonw);
// create hit object.
var spr = argument0;
var px = argument1;
var py = argument2;
var pz = argument3;
var dir = argument4;
var side = argument5;
var timer_destroy = argument6;
var knockdown = argument7;
var launch = argument8;

var inst = instance_create_depth(px, py, 0, objHit);
with(inst) {
	inst.z = pz;
	inst.sprite_index = spr;
	inst.side = eSide.Player;
	inst.alarm[0] = timer_destroy;
	inst.dir = dir;
	if(dir == eDir.Left) {
		// Flip collision mask.
		inst.image_xscale = -1;
	}
	inst.is_knockdown = knockdown;
	inst.is_launch    = launch;
}

return inst;
