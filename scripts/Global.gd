extends Node

var instances = {
	"player_1" : "",
	"player_2" : ""
}

@onready var screen_1 = true
@onready var background_start_sound = $background_start
var axis : Vector2
var player_1_life = 10
var player_1_name = "player_1"
var special_player_1 = false
var player_2_life = 10
var player_2_name = "player_2"
var special_player_2 = false

func _process(_delta):
	if screen_1 == false and background_start_sound.playing:
		music_down(background_start_sound)

func music_down(music):
	if music.playing:
		music.volume_db -= 0.8
		if music.volume_db <= -50:
			music.stop()


func get_axis(pj_name):
	if pj_name == player_1_name:
		axis.y = int(Input.is_action_pressed("down_player_1")) - int(Input.is_action_pressed("up_player_1"))
	elif pj_name == player_2_name:
		axis.y = int(Input.is_action_pressed("down_player_2")) - int(Input.is_action_pressed("up_player_2"))
	
	return axis.normalized()
	
func get_damage(pj_name, damage):
	if pj_name == player_1_name:
		player_1_life -= damage
		
	if pj_name == player_2_name:
		player_2_life -= damage
	
func get_special(pj_name):
	if pj_name == player_1_name:
		special_player_1 = true
		
	if pj_name == player_2_name:
		special_player_2 = true
