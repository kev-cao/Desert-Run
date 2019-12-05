extends KinematicBody

var pursuit = 20
var gravity = Vector3.DOWN * 9.8
var velocity = Vector3()
var speed = 4
var jump_speed = 5
var is_jumping = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pursuit = 30 - translation.x * -1
	if !$RunningSound.playing && is_on_floor():
		$RunningSound.play()
	elif !is_on_floor() && $RunningSound.playing:
		$RunningSound.stop()
		if !$JumpSound.playing:
			$JumpSound.play()
	
	

func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
	if is_jumping and is_on_floor():
		velocity.y = jump_speed

func get_input():
	velocity.z = 0
	velocity.x = 0
	
	if Input.is_action_pressed("strafe_left"):
		velocity.z -= speed
	elif Input.is_action_pressed("strafe_right"):
		velocity.z += speed
		
	is_jumping = false
	if Input.is_action_pressed("jump"):
		is_jumping = true