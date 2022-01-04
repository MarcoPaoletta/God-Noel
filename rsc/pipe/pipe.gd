extends Area2D

class_name pipe

func _on_pipe_body_entered(body):
	if body is player:
		die()
		
func die():
	global.can_spawn = false
	global.alive = false
