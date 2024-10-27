extends Node2D

const tile_width: int = 64
const tile_height: int = 64

const board_width: int = 11
const base_height: int = 7
const no_mans_land_height = 9
const total_height: int = 2 * base_height + no_mans_land_height

var buildings_p1: Array[Building]
var units_p1: Array[Unit]
var buildings_p2: Array[Building]
var units_p2: Array[Unit]

func _init() -> void:
	buildings_p1 = []
	units_p1 = []
	buildings_p2 = []
	units_p2 = []

func _ready() -> void:
	$Board.position.x = (get_viewport_rect().size.x - (board_width * tile_width)) / 2

func _process(delta: float) -> void:
	$Board.position.x = (get_viewport_rect().size.x - (board_width * tile_width)) / 2

func _draw() -> void:
	var horizontal_start = $Board.position.x
	var horizontal_end = board_width * tile_width + $Board.position.x
	
	var vertical_start = 0
	var vertical_end = total_height * tile_height
	
	# Horizontal lines
	for y in range(0, total_height + 1):
		var color = Color.DARK_GRAY
		var width = -1
		if y == base_height or y == total_height - base_height:
			color = Color.LIGHT_GRAY
			width = 3
		draw_line(Vector2i(horizontal_start, tile_height * y + vertical_start), Vector2i(horizontal_end, tile_height * y + vertical_start), color, width)
	
	# Vertical lines
	for x in range(0, board_width + 1):
		var color = Color.DARK_GRAY
		var width = -1
		draw_line(Vector2i(tile_width * x + horizontal_start, vertical_start), Vector2i(tile_width * x + horizontal_start, vertical_end), color, width)

func tile_coords_to_position(x: int, y: int) -> Vector2i:
	return Vector2i(x * tile_width, y * tile_height)

func tile_coords_to_index(x: int, y: int) -> int:
	return x * board_width + y

enum Building {
	Trench,
	Bunker,
}

enum Unit {
	Squad,
}
