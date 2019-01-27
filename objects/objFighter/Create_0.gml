// base y position.
#macro BASE_Z_TO_Y (384)

// timer
#macro KNOCK_DOWN_TIME (60)
#macro KNOCK_DOWN_RECOVERY_TIME (40)

// already check hit objects
#macro MAX_HIT_OBJECTS (16)

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
	
	Dead,
};

enum eDir {
	Left,
	Right,
};

enum eSide {
	Player,
	Enemy,
}

hp    = 100;
state = eState.Standby;
timer = 0;
dir   = eDir.Right;
// Convert y to z.
z     = -y;
y     = 0;
side  = eSide.Player;

hit_obj_idx = 0;

// already check hit objects.
already_hit_idx = 0;

// request damage.
request_damage_type = eAttackType.None;
request_damage_dir  = eDir.Left;
