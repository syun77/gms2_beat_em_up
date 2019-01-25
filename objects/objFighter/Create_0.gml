/// @description Insert description here
// You can write your code in this editor
enum eState {
	Standby,
	Punch,
	Punch2,
	Kick,
	Uppercut,
	Damage,
	Knockdown,
	Launch,
	Throw,
};

enum eDir {
	Left,
	Right,
};

enum eSide {
	Player,
	Enemy,
}

health = 100;
state = eState.Standby;
timer = 0;
dir   = eDir.Right;
// Convert y to z.
z     = -y;
y     = 0;
side  = eSide.Player;

request_damage_type = eAttackType.None;
request_damage      = false;
request_damage_dir  = eDir.Left;
request_knockdown   = false;
request_launch      = false;