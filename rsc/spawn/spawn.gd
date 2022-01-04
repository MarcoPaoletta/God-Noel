extends Node

export (PackedScene) var pipe
export (PackedScene) var cookie

onready var spawn_position: int = get_viewport().size.x + 50

var direction: String

var pos_y: int
var tops: int = 0
var bottoms: int = 0
var limit: int = 2

func _ready():
	randomize()

func _on_pipe_timeout():
	if global.can_spawn:
		var random_pos: int = randi() % 2
		if random_pos == 0:
			spawn_pipe_top()
		if random_pos == 1:
			spawn_pipe_bottom()

func spawn_pipe_top():
	tops += 1
	bottoms = 0
	if tops > limit:
		spawn_pipe_bottom()
		return
	var pipe_instance: Node = pipe.instance()
	pos_y = get_parent().get_node("floor/top").rect_position.y 
	pipe_instance.position.y = pos_y + 131
	pipe_instance.rotation_degrees = 180
	get_parent().get_node("floor").add_child(pipe_instance)
	pipe_instance.position.x = spawn_position
	direction = "top"

func spawn_pipe_bottom():
	bottoms += 1
	tops = 0
	if bottoms > limit:
		spawn_pipe_top()
		return
	var pipe_instance: Node = pipe.instance()
	pos_y = get_parent().get_node("floor/bottom").rect_position.y 
	pipe_instance.position.y = pos_y - 98
	get_parent().get_node("floor").add_child(pipe_instance)
	pipe_instance.position.x = spawn_position
	direction = "bottom"
	
	
func _on_cookie_timeout():
	spawn_cookie()

func spawn_cookie():
	if global.can_spawn:
		var amount: int = randi() % 2 + 1
		for times in range(amount):
			var cookie_instance: Node = cookie.instance()
			var offset: int = 100 * times
			get_parent().add_child(cookie_instance)
			cookie_instance.position.x = spawn_position - 150 - offset
			if direction == "top":
				cookie_instance.position.y = pos_y + 131
			if direction == "bottom":
				cookie_instance.position.y = pos_y - 98
			if tops == 2 or bottoms == 2:
				cookie_instance.queue_free()
				return
				

