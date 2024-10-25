extends Camera2D

const speed: float = 500

func _process(delta: float) -> void:
	var axis = Input.get_axis("ui_up", "ui_down")
	var new_y = position.y + axis * delta * speed
	position.y = clamp(new_y, 0, $"..".total_height * $"..".tile_height + get_viewport_rect().size.y)
