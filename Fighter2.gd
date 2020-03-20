extends KinematicBody2D


const UP = Vector2(0, -1)
var motion = Vector2()

func _physics_process(_delta):
	motion.y += 10
	
	if Input.is_action_pressed("ui_right2"):
		motion.x = 130
	elif Input.is_action_pressed("ui_left2"):
		motion.x = -130
	else:
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up2"):
			motion.y = -285
	
	motion = move_and_slide(motion, UP)
	
	pass