extends Camera2D

const speed: float = 800

func _process(delta: float) -> void:
	var axis = Input.get_axis("up", "down")
	var new_y = position.y + axis * delta * speed
	var min = 0
	var max = $"..".total_height * $"..".tile_height - get_viewport_rect().size.y
	position.y = clamp(new_y, min, max)
