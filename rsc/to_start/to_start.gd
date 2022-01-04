extends Label

func _process(delta):
	if Input.is_action_just_pressed("click"):
		global.player_state = "playing"
		hide()
