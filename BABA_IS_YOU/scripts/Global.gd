extends Node2D

enum {
	EMPTY,	# 0 - Empty Cell
	BOB,	# 1 - Bob Cell
	FLAG,	# 2 - Flag Cell
	ROCK,	# 3 - Rock Cell
	WALL,	# 4 - Wall Cell
	BOB_C,	# 5 - Bob Command Cell
	IS_C,	# 6 - Is Command Cell
	YOU_C,	# 7 - You Command Cell
	WALL_C,	# 8 - Wall Command Cell
	STOP_C,	# 9 - Stop Command Cell
	ROCK_C,	# 10 - Rock Command Cell
	PUSH_C,	# 11 - Push Command Cell
	FLAG_C,	# 12 - Flag Command Cell
	WIN_C	# 13 - Win Command Cell
}

var resource_texture = {
	BOB: preload("res://sprites/1.png"),
	FLAG: preload("res://sprites/2.png"),
	ROCK: preload("res://sprites/3.png"),
	WALL: preload("res://sprites/4.png"),
	BOB_C: preload("res://sprites/5.png"),
	IS_C: preload("res://sprites/6.png"),
	YOU_C: preload("res://sprites/7.png"),
	WALL_C: preload("res://sprites/8.png"),
	STOP_C: preload("res://sprites/9.png"),
	ROCK_C: preload("res://sprites/10.png"),
	PUSH_C: preload("res://sprites/11.png"),
	FLAG_C: preload("res://sprites/12.png"),
	WIN_C: preload("res://sprites/13.png"),
}

var current_level = 1

onready var gameResolution = [get_viewport().size.x, get_viewport().size.y]

var LEVEL1_POS = {
	BOB: [[8], [8]],
	FLAG: [[24], [8]],
	ROCK: [array_filled(5, 16), range(6, 11, 1)],
	WALL: [append_arrays(range(13, 20, 1), range(13, 20, 1)) , append_arrays(array_filled(7, 11), array_filled(7, 5))],
	#BOB_C: [[5, 5]],
	#IS_C: [[6, 6]],
	#YOU_C: [[7, 7]],
	#WALL_C: [[8, 8]],
	#STOP_C: [[9, 9]],
	#ROCK_C: [[10, 10]],
	#PUSH_C: [[11, 11]],
	#FLAG_C: [[12, 12]],
	#WIN_C: [[31, 15]]
}

func array_filled(num, val):
	var a = []
	a.resize(num)
	a.fill(val)
	return a

func append_arrays(arr1, arr2):
	arr1.append_array(arr2)
	return arr1
