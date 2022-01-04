extends Control

func _on_score_timer_timeout():
	update_score()

func cookie_touched():
	global.cookies += 1
	$cookie.play()

func update_score():
	if global.alive and global.player_state == "playing":
		global.score += 1
		$score.text = str(global.score)
