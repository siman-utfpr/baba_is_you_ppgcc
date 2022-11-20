extends Node2D

enum {
	EMPTY,		# 0 - Empty Cell
	BOB,		# 1 - Bob Cell
	FLAG,		# 2 - Flag Cell
	ROCK,		# 3 - Rock Cell
	WALL,		# 4 - Wall Cell
	BOB_C,		# 5 - Bob Command Cell
	IS_C,		# 6 - Is Command Cell
	YOU_C,		# 7 - You Command Cell
	WALL_C,		# 8 - Wall Command Cell
	STOP_C,		# 9 - Stop Command Cell
	ROCK_C,		# 10 - Rock Command Cell
	PUSH_C,		# 11 - Push Command Cell
	FLAG_C,		# 12 - Flag Command Cell
	WIN_C		# 13 - Win Command Cell
}

var COMMANDS = [
	BOB_C,
	WALL_C,
	FLAG_C,
	ROCK_C,
	IS_C,
	YOU_C,
	STOP_C,
	PUSH_C,
	WIN_C 
]

var OBJECTS = [
	BOB,
	FLAG,
	ROCK,
	WALL
]

var RESOURCE_TEXTURE = {
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

var OBJ_CORRELATION = {
	BOB_C: BOB,
	FLAG_C: FLAG,
	ROCK_C: ROCK,
	WALL_C: WALL
}

# you, push, stop, win
var INSTANCE_STATES = {
	YOU_C: EMPTY,
	PUSH_C: EMPTY,
	STOP_C: EMPTY,
	WIN_C: EMPTY
}

var LEVEL1_POS = [
	
	[WALL, [12, 5]],
	[WALL, [13, 5]],
	[WALL, [14, 5]],
	[WALL, [15, 5]],
	[WALL, [16, 5]],
	[WALL, [17, 5]],
	[WALL, [18, 5]],
	[WALL, [19, 5]],
	[WALL, [20, 5]],
	
	[WALL, [12, 11]],
	[WALL, [13, 11]],
	[WALL, [14, 11]],
	[WALL, [15, 11]],
	[WALL, [16, 11]],
	[WALL, [17, 11]],
	[WALL, [18, 11]],
	[WALL, [19, 11]],
	[WALL, [20, 11]],
	
	[ROCK, [16, 6]],
	[ROCK, [16, 7]],
	[ROCK, [16, 8]],
	[ROCK, [16, 9]],
	[ROCK, [16, 10]],
	
	[BOB, [8, 8]],
	[FLAG, [24, 8]],
	
	[BOB_C, [12, 3]],
	[IS_C, [13, 3]],
	[YOU_C, [14, 3]],
	
	[WALL_C, [18, 3]],
	[IS_C, [19, 3]],
	[STOP_C, [20, 3]],
	
	[ROCK_C, [12, 13]],
	[IS_C, [13, 13]],
	[PUSH_C, [14, 13]],
	
	[FLAG_C, [18, 13]],
	[IS_C, [19, 13]],
	[WIN_C, [20, 13]],
]

var CURRENT_LEVEL = 1

onready var GAMERESOLUTION = [get_viewport().size.x, get_viewport().size.y]

var display_div = [32, 16]
