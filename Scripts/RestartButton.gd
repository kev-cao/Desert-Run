extends Control

onready var sprite = get_node("Sprite")
onready var button = get_node("Button")


var default = preload("res://Assets/buttonDefault.png")
var pressed = preload("res://Assets/buttonSelected.png")

func _on_Button_button_down():
	sprite.set_texture(pressed)


func _on_Button_button_up():
	sprite.set_texture(default)
	if button.get_rect().has_point(get_viewport().get_mouse_position()):
		get_parent().get_tree().change_scene("res://Scenes/World.tscn")