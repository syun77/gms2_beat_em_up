/// @description Insert description here
// You can write your code in this editor
if(instance_exists(objPlayer) == false) {
	return;
}

var px = objPlayer.x;
var pz = objPlayer.z;

var furthest = noone;
var distance = 0;
with(objEnemy) {
	to_distance = eDistance.Normal;
	var dist = point_distance(x, z, px, pz);
	if(dist > distance) {
		distance = dist;
		furthest = id;
	}
}
if(furthest != noone) {
	furthest.to_distance = eDistance.Furthest;
}

var nearest = noone;
var distance = 999999;
with(objEnemy) {
	var dist = point_distance(x, z, px, pz);
	if(dist < distance) {
		distance = dist;
		nearest = id;
	}
}
if(nearest != noone) {
	nearest.to_distance = eDistance.Nearest;
}
