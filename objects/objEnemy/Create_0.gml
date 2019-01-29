/// @description Insert description here
// You can write your code in this editor
enum eDistance {
	Normal,
	Nearest,
	Furthest,
};

enum eAI {
	Standby,
	CloseTo,
	GoAround,
	Dash,
};

event_inherited();

side   = eSide.Enemy;
dir    = eDir.Left;
hp     = 50;

cnt    = 0;

to_distance = eDistance.Normal;
ai_state = eAI.Standby;
ai_timer = 0;

debug_draw_info = true;
