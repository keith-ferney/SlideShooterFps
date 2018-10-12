
extends KinematicBody

# Member variables
var g = -9.8
var vel = Vector3()
const MAX_SPEED = 2000
const JUMP_SPEED = 7
const ACCEL= 5
const DEACCEL= 4
const MAX_SLOPE_ANGLE = 30


func _physics_process(delta):
	var up = -g # (up is against gravity)
	var lv = linear_velocity
	var g = Vector3(0, -9.8, 0)

#	var d = 1.0 - delta*state.get_total_density()
#	if (d < 0):
#		d = 0
	lv += g * delta # Apply gravity

	var anim = ANIM_FLOOR

	var up = -g # (up is against gravity)
	var vv = up.dot(lv) # Vertical velocity
	var hv = lv - up * vv # Horizontal velocity

	var hdir = hv.normalized() # Horizontal direction
	var hspeed = hv.length() # Horizontal speed

	if get_parent().player_id == get_tree().get_network_unique_id():
		var cam_xform = get_node("../../Camera").get_global_transform()
		# set_rotation($"../../Camera".get_rotation())
		var dir = Vector3() # Where does the player intend to walk to
		if Input.is_action_pressed("ui_up"):
			dir += -cam_xform.basis[2]
		if Input.is_action_pressed("ui_down"):
			dir += cam_xform.basis[2]
		if Input.is_action_pressed("ui_left"):
			dir += -cam_xform.basis[0]
		if Input.is_action_pressed("ui_right"):
			dir += cam_xform.basis[0]

		dir.y = 0
		dir = dir * MAX_SPEED
		dir = dir *delta


		if is_on_floor() and Input.is_action_pressed("ui_jump"):
			if  < max_speed:
				hspeed += accel * delta
			move_and_slide(dir, Vector3(0,g,0))
			vel.y = JUMP_SPEED
		rpc_unreliable("do_move", get_translation(), get_name())

remote func do_move(position, pid):
	var root  = get_parent()
	var pnode = root.get_node(str(pid))

	pnode.set_translation(position)


func _on_tcube_body_enter(body):
	if body == self:
		get_node("../ty").show()
