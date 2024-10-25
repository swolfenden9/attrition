extends Node2D

const tile_width: int = 8
const tile_height: int = 8

const board_width: int = 11
const base_height: int = 7
const no_mans_land_height = 11

var tiles: Array[int] = []

func _init() -> void:
	var index = tile_coords_to_index(0, 0)
	tiles[index] = 2

func tile_coords_to_position(x: int, y: int) -> Vector2i:
	return Vector2i(x * tile_width, y * tile_height)

func tile_coords_to_index(x: int, y: int) -> int:
	return x * board_width + y
