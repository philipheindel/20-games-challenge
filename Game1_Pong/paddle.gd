extends StaticBody2D

var on_top: bool = false
var on_bottom: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up") && !on_top:
		position.y = position.y - 1
	elif Input.is_action_pressed("ui_down") && !on_bottom:
		position.y = position.y + 1
	
