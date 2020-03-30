extends KinematicBody2D

onready var animation = get_node("../../test/KinematicBody2D/Sprite/AnimationPlayer") 
onready var coll = get_node("../../test/KinematicBody2D/CollisionShape2D:shape")
const UP = Vector2(0, -1)
var motion = Vector2()
func _ready():
    print(self.get_path())
func _on_AnimationPlayer_ready():
	pass
func _physics_process(_delta):
	motion.y += 10
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 130
		animation.play("walkR")
#		$Sprite.play("walkR")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -130
		animation.play("walkL")
#		$Sprite.play("walkL")
	else:
		motion.x = 0
		
	
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -285
	
	motion = move_and_slide(motion, UP)
	
	pass
