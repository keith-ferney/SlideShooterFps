extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	if gamestate.player_type == "server":
		$network.start_server()
	pass
	if gamestate.player_type == "client":
		$network.join_server(gamestate.server_ip)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if event.is_action("ui_cancel"):
		get_tree().change_scene("Menus/Main.tscn")
