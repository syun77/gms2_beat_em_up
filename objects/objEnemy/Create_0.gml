/// @description Insert description here
// You can write your code in this editor
enum eDistance {
	Normal,
	Nearest,
	Furthest,
};

event_inherited();

side   = eSide.Enemy;
dir    = eDir.Left;
hp     = 50;

cnt    = 0;

to_distance = eDistance.Normal;

debug_draw_info = true;
