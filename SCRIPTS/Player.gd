extends Sprite

onready var Grid: TileMap = get_parent()

var playerStates : Array

func _ready():
	playerStates = Grid.get_player_current_states()
	var currentCells = Grid.get_player_current_cells(playerStates)
	print(currentCells)
	pass

func _input(event):
	pass

func move(playerObjectArray: Array, xdif : int, ydif : int) -> bool:
	for objectPos in playerObjectArray:
		for id in objectPos:
			print(Grid.get_ids_from_relation(Grid.get_cellv(id), xdif, ydif))
	return true
