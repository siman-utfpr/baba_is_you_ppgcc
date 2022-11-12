extends Node2D

func _ready():
	print(Globals.gameResolution)
	load_level(Globals.LEVEL1_POS, 1, [32, 16])
	pass


func load_level(level_obj_pos, scale, display_div):
	var widthVec = range(0, Globals.gameResolution[0], Globals.gameResolution[0] / display_div[0])
	var heightVec = range(0, Globals.gameResolution[1], Globals.gameResolution[1] / display_div[1])
	for obj in level_obj_pos:
		print(level_obj_pos[obj][0])
		print(level_obj_pos[obj][1])
		for i in len(level_obj_pos[obj][0]):
			var currentInst = Sprite.new()
			currentInst.texture = Globals.resource_texture[obj] 
			currentInst.position = Vector2(widthVec[level_obj_pos[obj][0][i]], heightVec[level_obj_pos[obj][1][i]])
			currentInst.centered = false
			currentInst.scale = Vector2(scale, scale)
			add_child(currentInst)
