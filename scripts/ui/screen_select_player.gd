extends Control

var player_1_pick = true
var player_2_pick = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/player_select.text = "Selección player 1"


func _on_character_1_pressed():
	if player_1_pick:
		var preload_player_1 = preload("res://scenes/fighters/character_racket_speed.tscn")
		Global.instances["player_1"] = preload_player_1
		$Panel/character_1.text = "\n\nPlayer_1"
		player_1_pick = false
		player_2_pick = true
		$Panel/player_select.text = "Selección player 2"
	elif player_2_pick:
		var preload_player_2 = preload("res://scenes/fighters/character_racket_speed.tscn")
		Global.instances["player_2"] = preload_player_2
		$Panel/character_1.text = "\n\n\nPlayer_2"
		end_selection()
		
	$Panel/character_1.disabled = true
	
	$Panel/character_1/AnimatedSprite2D.stop()


func _on_character_2_pressed():
	if player_1_pick:
		var preload_player_1 = preload("res://scenes/fighters/character_racket_speed.tscn")
		Global.instances["player_1"] = preload_player_1
		$Panel/character_2.text = "\n\nPlayer_1"
		player_1_pick = false
		player_2_pick = true
		$Panel/player_select.text = "Selección player 2"
	elif player_2_pick:
		var preload_player_2 = preload("res://scenes/fighters/character_racket_speed.tscn")
		Global.instances["player_2"] = preload_player_2
		$Panel/character_2.text = "\n\n\nPlayer_2"
		end_selection()
		
	$Panel/character_2.disabled = true
	
	$Panel/character_2/AnimatedSprite2D.stop()


func _on_character_3_pressed():
	if player_1_pick:
		var preload_player_1 = preload("res://scenes/fighters/character_racket_speed.tscn")
		Global.instances["player_1"] = preload_player_1
		$Panel/character_3.text = "\n\nPlayer_1"
		player_1_pick = false
		player_2_pick = true
		$Panel/player_select.text = "Selección player 2"
	elif player_2_pick:
		var preload_player_2 = preload("res://scenes/fighters/character_racket_speed.tscn")
		Global.instances["player_2"] = preload_player_2
		$Panel/character_3.text = "\n\n\nPlayer_2"
		end_selection()
		
	$Panel/character_3.disabled = true
	
	$Panel/character_3/AnimatedSprite2D.stop()

func end_selection():
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")
