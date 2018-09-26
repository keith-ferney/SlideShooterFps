extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var view_sensitivity = 0.20
var player_id = 0
var yaw = 0
var pitch = 0

# func _ready():
# 	# Called when the node is added to the scene for the first time.
# 	# Initialization here
# 	Input.set_mouse_mode(0)
# 	set_current(true)
# 	pass
#
# func _physics_process(delta):
# 	var player = get_node("../Ball")
# 	var cameraPos = player.get_translation()
# 	cameraPos.y += 2
# 	set_translation(cameraPos)
#
# func _input(event):
# 	if event is InputEventScreenDrag:
# 		yaw = fmod(yaw - event.relative.x * view_sensitivity, 360)
# 		pitch = max(min(pitch - event.relative.y * view_sensitivity, 85), -85)
# 		set_translation(Vector3(deg2rad(pitch), deg2rad(yaw), 0))
# 	elif event is InputEventMouseMotion and Input.is_action_pressed("click_left"):
# 		yaw = fmod(yaw - event.relative.x * view_sensitivity, 360)
# 		pitch = max(min(pitch - event.relative.y * view_sensitivity, 85), -85)
# 	var ball = get_node("../Ball")
# 	var loc = ball.get_translation()
# 	loc.x += 5
# 	loc.y += 5
# 	set_translation(loc)
# 	look_at(get_node("../Ball").get_translation(), Vector3(0,1,0))
