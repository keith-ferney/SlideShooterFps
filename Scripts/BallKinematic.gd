
extends KinematicBody

# Member variables
var g = -9.8
var vel = Vector3()
const MAX_SPEED = 20000
const JUMP_SPEED = 7
const ACCEL= 5
const DEACCEL= 4
const MAX_SLOPE_ANGLE = 30


func _physics_process(delta):
	if get_parent().player_id == get_tree().get_network_unique_id():
		var camt = get_node("../../Camera").get_translation()
		get_node("../../Camera").set_translation(Vector3(0,20,0))
		var dir = camt # Where does the player intend to walk to
		if Input.is_action_pressed("ui_up"):
			dir.z += -MAX_SPEED
		if Input.is_action_pressed("ui_down"):
			dir.z += MAX_SPEED
		if Input.is_action_pressed("ui_left"):
			dir.x += -MAX_SPEED
		if Input.is_action_pressed("ui_right"):
			dir.x += MAX_SPEED

		dir.y = 0
		dir = dir *delta
		move_and_slide(dir, Vector3(0,3,0))


		if is_on_floor() and Input.is_action_pressed("ui_jump"):
			vel.y = JUMP_SPEED
		rpc_unreliable("do_move", get_translation(), get_name())

remote func do_move(position, pid):
	var root  = get_parent()
	var pnode = root.get_node(str(pid))

	pnode.set_translation(position)


func _on_tcube_body_enter(body):
	if body == self:
		get_node("../ty").show()
