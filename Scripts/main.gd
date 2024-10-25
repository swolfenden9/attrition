extends Node2D

const tile_width: int = 64
const tile_height: int = 64

const board_width: int = 11
const base_height: int = 7
const no_mans_land_height = 9
const total_height: int = 2 * base_height + no_mans_land_height

var tiles: Array[int]

func _init() -> void:
	tiles = []

func _draw() -> void:
	var horizontal_start = 0
	var horizontal_end = get_viewport_rect().size.x
	
	var vertical_start = 0
	var vertical_end = total_height * tile_height
	
	# Horizontal lines
	for y in range(1, total_height):
		var color = Color.DARK_GRAY
		var width = -1
		if y == base_height or y == total_height - base_height:
			color = Color.LIGHT_GRAY
			width = 3
		draw_line(Vector2i(horizontal_start, tile_height * y), Vector2i(horizontal_end, tile_height * y), color, width)
	
	# Vertical lines
	for x in range(1, board_width):
		var color = Color.DARK_GRAY
		var width = -1
		draw_line(Vector2i(tile_width * x, vertical_start), Vector2i(tile_width * x, vertical_end), color, width)

func tile_coords_to_position(x: int, y: int) -> Vector2i:
	return Vector2i(x * tile_width, y * tile_height)

func tile_coords_to_index(x: int, y: int) -> int:
	return x * board_width + y
