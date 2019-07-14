extends KinematicBody2D

export var SPEED = 300

var motion = Vector2(0, SPEED)

func bounce(collision):
	motion = motion.bounce(collision.get_normal())

# warning-ignore:unused_argument
func paddle_collision(delta, collision):
	var paddle = collision.get_collider()
	var collisionPosition = collision.get_position()
	var paddlePosition = paddle.get_position()
	var paddleWidth = paddle.get_width()
	
	var hitOnLeft = paddlePosition.x > collisionPosition.x
	var hitCenter = paddlePosition.x == collisionPosition.x
	
	if hitCenter:
		bounce(collision)
	else:
		var xRatio = 1
		var yRatio = 1
		
		if hitOnLeft: # Hit on left side of paddle
			var rightWidth = abs(paddlePosition.x - collisionPosition.x)
			var leftWidth = abs((paddleWidth / 2) - rightWidth)
			
			xRatio = -(leftWidth / (paddleWidth / 2))
		else: # Hit on right side of paddle
			var leftWidth = abs(collisionPosition.x - paddlePosition.x)
			var rightWidth = abs((paddleWidth / 2) - leftWidth)
			
			xRatio = (rightWidth / (paddleWidth / 2))
		
		yRatio = -(1 - abs(xRatio))
		
		motion = Vector2(SPEED * xRatio, SPEED * yRatio)

func brick_collision(delta, collision):
	# Maintain regular motion
	bounce(collision)
	
	var brick = collision.get_collider()
	brick.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if get_slide_count() > 0:
		var collision = get_slide_collision(0)
		
		var collider = collision.get_collider()
		
		if collider.name == 'paddle':
			paddle_collision(delta, collision)
		elif 'brick' in collider.name:
			brick_collision(delta, collision)
		else:
			bounce(collision)
	
# warning-ignore:return_value_discarded
	move_and_slide(motion)