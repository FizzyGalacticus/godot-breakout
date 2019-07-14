extends StaticBody2D

var globals

func _ready():
	globals = get_node('/root/global')
	globals.incrementBricks()

func hit():
	globals.increasePlayerPoints()
	globals.decrementBricks()
	queue_free()
