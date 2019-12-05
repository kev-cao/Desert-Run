extends Control

var timer = 0
var pursuit = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$Label.text = 'Timer: %.2f s \nPursuit: %.2f m' % [timer, pursuit]