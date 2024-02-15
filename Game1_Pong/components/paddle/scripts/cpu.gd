extends StaticBody2D


var _ball_position: Vector2
var _distance: int
var _move_by: int
var _window_height: int
var _paddle_height: int


# Called when the node enters the scene tree for the first time.
func _ready():
	_window_height = get_viewport_rect().size.y
	_paddle_height = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("Processing")
	_ball_position = $"../Ball".position
	_distance = position.y - _ball_position.y
	
	if abs(_distance) > get_parent().PADDLE_SPEED * delta:
		_move_by = get_parent().PADDLE_SPEED * delta * (_distance / abs(_distance))
	else:
		_move_by = _distance
	
	position.y -= _move_by
	
	position.y = clamp(position.y, _paddle_height / 2, _window_height - _paddle_height / 2)
