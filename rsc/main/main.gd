extends Node

func _process(delta):
	state()
	move_or_delete_objects(delta)
			
func state():
	if global.player_state == "waiting":
		$hud.hide()
		global.can_spawn = false
	else:
		$hud.show()
		global.can_spawn = true
		
func move_or_delete_objects(delta):
	for nodes in get_tree().get_nodes_in_group("object"):
		if global.alive:
			global.move_left(nodes, delta)
		else:
			nodes.queue_free()
