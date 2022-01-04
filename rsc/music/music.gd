extends AudioStreamPlayer

func _process(delta):
	if !global.alive:
		playing = false
