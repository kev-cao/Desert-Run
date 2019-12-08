extends KinematicBody

var speed = 10 # speed at which the building moves
var movement = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	move_lock_x = true
	move_lock_y = true
	move_lock_z = true
	pass # Replace with function body.

		
func _physics_process(delta):
	move_and_slide(Vector3(-speed, 0, 0))
	if translation.x < -60:
		self.queue_free()