extends Spatial

export var timer = 0
export var pursuit = 30
export var time_elapsed_since_increase = 0

signal increase_speed
signal lose
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var spawner = get_node("BuildingSpawner")
	
	connect("increase_speed", spawner, "_increase_speed")
	pass # Replace with function body.

func _process(delta):
	timer += delta
	time_elapsed_since_increase += delta
	pursuit = find_node("Character").pursuit
	find_node("Control").timer = timer
	find_node("Control").pursuit = pursuit
	if time_elapsed_since_increase >= 10:
		emit_signal("increase_speed")
		time_elapsed_since_increase = 0
	if pursuit <= 0:
		Global.timer = timer
		get_tree().change_scene("res://Scenes/End.tscn")