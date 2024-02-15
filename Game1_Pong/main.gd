extends Node2D

const PADDLE_SPEED: int = 500
var _player_score: int = 0
var _cpu_score: int = 0

func _ready():
	$BallTimer.start()


func _on_timer_timeout():
	$Ball.new_ball()


func _on_player_zone_body_entered(body):
	if body == $Ball:
		_cpu_score += 1
		$CPU_Score.text = str(_cpu_score)
		$Timer_Label.set_visible(true)
		$BallTimer.start()


func _on_cpu_zone_body_entered(body):
	if body == $Ball:
		_player_score += 1
		$Player_Score.text = str(_player_score)
		$Timer_Label.set_visible(true)
		$BallTimer.start()
