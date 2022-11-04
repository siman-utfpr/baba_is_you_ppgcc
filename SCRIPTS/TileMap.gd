extends TileMap

const TileSetIdRef = {
	"objects": {
		"BOB": 0,
		"FLAG": 1,
		"ROCK": 2,
		"WALL": 3
	},
	"commands": {
		"BOB_C": 4,
		"IS_C": 5,
		"YOU_C": 6,
		"WALL_C": 7,
		"STOP_C": 8,
		"ROCK_C": 9,
		"PUSH_C": 10,
		"FLAG_C": 11,
		"WIN_C": 12
	}
}

func get_player_current_states() -> Array:
	var back1X = get_ids_from_relation(TileSetIdRef.commands.YOU_C, -1, 0)[0]
	var back2X = get_ids_from_relation(TileSetIdRef.commands.YOU_C, -2, 0)[0]
	
	var back1Y = get_ids_from_relation(TileSetIdRef.commands.YOU_C, 0, -1)[0]
	var back2Y = get_ids_from_relation(TileSetIdRef.commands.YOU_C, 0, -2)[0]
	
	var states = []
	
	if back1X == TileSetIdRef.commands.IS_C or back1Y == TileSetIdRef.commands.IS_C:
		match back2X:
			TileSetIdRef.commands.BOB_C: 
				states.append(TileSetIdRef.objects.BOB)
			TileSetIdRef.commands.FLAG_C: 
				states.append(TileSetIdRef.objects.FLAG)
			TileSetIdRef.commands.WALL_C: 
				states.append(TileSetIdRef.objects.WALL)
			TileSetIdRef.commands.ROCK_C: 
				states.append(TileSetIdRef.objects.ROCK)
		match back2Y:
			TileSetIdRef.commands.BOB_C: 
				states.append(TileSetIdRef.objects.BOB)
			TileSetIdRef.commands.FLAG_C: 
				states.append(TileSetIdRef.objects.FLAG)
			TileSetIdRef.commands.WALL_C: 
				states.append(TileSetIdRef.objects.WALL)
			TileSetIdRef.commands.ROCK_C: 
				states.append(TileSetIdRef.objects.ROCK)
	return states
	
func get_player_current_cells(playerStates : Array) -> Array:
	var array = []
	for pState in playerStates:
		match pState:
			TileSetIdRef.objects.BOB:
				array.append(get_used_cells_by_id(TileSetIdRef.objects.BOB))
			TileSetIdRef.objects.FLAG:
				array.append(get_used_cells_by_id(TileSetIdRef.objects.FLAG))
			TileSetIdRef.objects.ROCK:
				array.append(get_used_cells_by_id(TileSetIdRef.objects.ROCK))
			TileSetIdRef.objects.WALL:
				array.append(get_used_cells_by_id(TileSetIdRef.objects.WALL))
	return array

func get_ids_from_relation(IdRef : int, xdif : int, ydif : int) -> Array:
	var idPosList = get_used_cells_by_id(IdRef)
	var array = []
	for idPos in idPosList:
		array.append(get_cell(idPos[0] + xdif, idPos[1] + ydif))
	return array
