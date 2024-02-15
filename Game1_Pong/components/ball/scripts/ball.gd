extends RigidBody2D


const _START_SPEED: int = 500
const _ACCELERATION: int = 50
var _speed: int
var _direction: Vector2
var _window_size: Vector2


func _ready():
	_window_size = get_viewport_rect().size


func _physics_process(delta):
	var _collision: KinematicCollision2D = move_and_collide(_direction * _speed * delta)
	var _collider
	if _collision:
		_collider = _collision.get_collider()
		if _collider == $"../Player" or _collider == $"../CPU":
			_speed += _ACCELERATION
		_direction = _direction.bounce(_collision.get_normal())


func new_ball():
	position.x = _window_size.x / 2
	position.y = randi_range(200, _window_size.y - 200)
	_speed = _START_SPEED
	_direction = _random_direction()


func _random_direction():
	var _new_direction: Vector2 = Vector2()
	_new_direction.x = [1, -1].pick_random()
	_new_direction.y = randf_range(-1, 1)
	return _new_direction.normalized()
