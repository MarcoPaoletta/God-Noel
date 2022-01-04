extends Control

func _on_button_pressed():
	$play_sound.play()
	$button.disabled = true
	yield($play_sound, "finished")
	get_tree().change_scene("res://rsc/main/main.tscn")

func _ready():
	global.load_data()
