extends KinematicBody2D

class_name player

var gravity: int = 100
var speed: int = 150

var velocity: Vector2 = Vector2.ZERO

func _ready():
	new_game()
	position.y = get_viewport().size.y / 2

func _process(delta):
	if not global.alive:
		gravity = 100
		$animated_sprite.play("die")
		$animated_sprite.flip_v = false
		yield($animated_sprite,	"animation_finished")
		get_tree().change_scene("res://rsc/game_over/game_over.tscn")
	else:
		move()
		change_animation()

func _physics_process(delta):
	apply_physics()

func move():
	if Input.is_action_just_pressed("click") and global.player_state == "playing":
		$move.play()
		gravity *= -1
		match gravity:
			100:
				$animated_sprite.flip_v = false
			-100:
				$animated_sprite.flip_v = true
				
func change_animation():
	if global.alive:
		if velocity.length() > 0 or global.player_state == "waiting":
			$animated_sprite.play("idle")
		else:
			$animated_sprite.play("run")

func apply_physics():
	if global.player_state == "playing":
		print(gravity)
		velocity.y += gravity
		velocity = move_and_slide(velocity, Vector2.UP)

func new_game():
	global.score = 0
	global.cookies = 0
	global.player_state = "waiting"
	global.alive = true
	global.can_spawn = true

