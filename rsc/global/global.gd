extends Node

var player_state: String

var screen_size: Vector2 = Vector2(512, 700)

var cookies: int = 0
var score: int = 0
var velocity: int = 400

var alive: bool = true
var can_spawn: bool = true

var game: Dictionary = {
	"high_score": 0
}

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		save_data()
		
func _ready():
	OS.center_window()
	set_stretch()
	
func set_stretch():
	if OS.get_name() == "Android":
		get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_EXPAND, screen_size)
	if OS.get_name() == "Windows":
		get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_KEEP_WIDTH, screen_size)
		OS.window_maximized = true
		OS.min_window_size = screen_size

func move_left(node, delta):
	node.position.x -= global.velocity * delta

var path = "user://save.sv" # FILE PATH
func save_data():
	print("saved")
	var save_file = File.new() # CREATE FILE
	save_file.open(path, File.WRITE) # OPEN IT IN THE PATH AND WRITE IN IT
	var data = {
		"game" : game # TO STORE VAR
	}
	save_file.store_var(data) # STORE
	save_file.close() # CLOSE

# LOAD SYSTEM
func load_data():
	print("loaded")
	var save_file = File.new() # GO TO THE FILE AGAIN
	if !save_file.file_exists(path): # IF IT DOES NOT EXIST
		return # WE RETURN SO THAT IT WILL BE CREATED
	save_file.open(path, File.READ) # OEN IT IN THE PATH AND READ IT
	var data = save_file.get_var() # CREATE A VAR TO GET THE VAR STORED IN THE FILE
	game = data["game"] # MODIFY THE DATA IN THE DICT
	save_file.close() # CLOSE
