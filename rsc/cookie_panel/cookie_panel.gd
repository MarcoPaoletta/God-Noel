extends Panel


func _process(delta):
	update_cookies()
	set_panel_offset()

func update_cookies():
	$cookie.text = "x" + str(global.cookies)
	
func set_panel_offset():
	var offset: int = 70
	rect_size.x = offset + $cookie.rect_size.x
