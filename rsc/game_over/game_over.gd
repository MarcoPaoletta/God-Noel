extends Control

func _ready():
	check_high_score()
	update_labels()

func _process(delta):
	set_aux_color_size()

func check_high_score():
	if global.score >= global.game["high_score"]:
		global.game["high_score"] = global.score
		print("si")
		
func update_labels():
	$score.text = "x" + str(global.score)
	$high_score.text = "x" + str(global.game["high_score"])
	$cookies.text = "x" + str(global.cookies)
	
func set_aux_color_size():
	$aux_color.rect_size = get_viewport().size

func _on_lobby_button_pressed():
	global.alive = true
	$play_sound.play()
	$lobby_button.disabled = true
	yield($play_sound, "finished")
	get_tree().change_scene("res://rsc/lobby/lobby.tscn")
