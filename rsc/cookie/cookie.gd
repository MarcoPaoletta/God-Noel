extends Area2D

class_name cookie

export (PackedScene) var cookie_explosion

func _on_cookie_area_entered(area):
	if area is pipe:
		get_parent().get_node("spawner").spawn_cookie()

func _on_cookie_body_entered(body):
	if body is player:
		get_parent().get_node("hud").cookie_touched()
		instance_cookie_explosion()
		queue_free()
		
func instance_cookie_explosion():
	var cookie_explosion_instance = cookie_explosion.instance()
	get_parent().add_child(cookie_explosion_instance)
	cookie_explosion_instance.position = position
	cookie_explosion_instance.emitting = true
