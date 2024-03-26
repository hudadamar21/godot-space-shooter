extends Control

@export var level_scene: PackedScene

func _ready():
	var label = $CenterContainer/VBoxContainer/Label2
	label.text = label.text + str(Global.score)
	$LoseSound.play()

func _input(event):
	if event.is_action_pressed("shot"):
		get_tree().change_scene_to_packed(level_scene)
