extends CanvasLayer

static var image = load("res://graphics/playerLife2_red.png")

#var time_elapsed := 0 

func set_health(amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()

	for i in amount:
		var texrect = TextureRect.new()
		texrect.texture = image
		$MarginContainer2/HBoxContainer.add_child(texrect)

func _on_score_timer_timeout():
	Global.score += 1
	$MarginContainer/Label.text = str(Global.score)
