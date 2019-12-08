extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 10
var time_elapsed = 0

func _physics_process(delta):
	time_elapsed += delta
	move_and_slide(Vector3(-speed, 0, 0))
	if time_elapsed >= .5:
		transform = transform.translated(Vector3(speed / 2, 0, 0))
		time_elapsed = 0