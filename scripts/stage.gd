extends Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_Q) and Input.is_key_pressed(KEY_CONTROL):
		get_tree().quit()
