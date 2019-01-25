#macro BASE_Z_TO_Y (384)

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
request_damage_dir  = eDir.Left;
