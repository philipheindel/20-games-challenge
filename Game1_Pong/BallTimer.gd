extends Timer


func _process(delta):
	var _time_left: int = int(time_left)
	$"../Timer_Label".text = str(_time_left)
	if time_left == 0:
		$"../Timer_Label".set_visible(false)
