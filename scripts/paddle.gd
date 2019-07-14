extends KinematicBody2D

export var SPEED = 300

var motion = Vector2()

func get_width():
	return $CollisionShape2D.shape.extents.x

func get_position():
	return position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.x = 0
	motion.y = 0
	
	if Input.is_action_pressed('ui_right'):
		motion.x += SPEED
	
	if Input.is_action_pressed('ui_left'):
		motion.x += -SPEED
	
#	if Input.is_action_pressed('ui_up'):
#		motion.y = -SPEED
#
#	if Input.is_action_pressed('ui_down'):
#		motion.y = SPEED
	
	move_and_slide(motion)

