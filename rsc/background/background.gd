extends TextureRect

func _process(delta):
	scroll(delta)
	reset_position()

func scroll(delta):
	if global.alive:
		rect_position.x -= global.velocity * delta
	
func reset_position():
	var texture_size = texture.get_size().x
	var offset: int = 1024 / 2
	if rect_position.x <= -texture_size + offset:
		rect_position.x += texture_size - offset
