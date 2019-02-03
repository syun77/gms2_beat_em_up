// base y position.
#macro BASE_Z_TO_Y (384)
#macro RANGE_POSITION_Z (64)
#macro MIN_Z (-RANGE_POSITION_Z - BASE_Z_TO_Y)
#macro MAX_Z ( RANGE_POSITION_Z - BASE_Z_TO_Y)

#macro HIT_RANGE_Z (16)

#macro GRASP_OFFSET_X (36)

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
	Grasping,
	GraspingKnee,
	GraspingKnee2,
	GraspingKnee3,
	Grasped,
	GraspedDamage,
	
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

hit_obj_idx = noone;
recovery_frame = 0;

// already check hit objects.
already_hit_idx[MAX_HIT_OBJECTS] = noone;
for(var i = 0; i < MAX_HIT_OBJECTS; i++) {
	already_hit_idx[i] = noone;
}

// request damage.
request_damage_type = eAttackType.None;
request_damage_dir  = eDir.Left;

// request to grasp fighter.
request_grasping = false;
request_grasped_fighter = noone;
request_grasped = false;
request_free_to_grasped_fighter = false;