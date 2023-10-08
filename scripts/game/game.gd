extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var character_1 = Global.instances["player_1"].instantiate()
	character_1.player_name = "player_1"
	character_1.position.x = 60
	character_1.position.y = 400
	get_tree().current_scene.add_child(character_1)

	var character_2 = Global.instances["player_2"].instantiate()
	character_2.player_name = "player_2"
	character_2.position.x = 1220
	character_2.position.y = 400
	character_2.rotation = PI*1
	get_tree().current_scene.add_child(character_2)


