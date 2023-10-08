extends CharacterBody2D

var speed = 400.0
var power = 3
var life = 10
var player_name = "player_2"
var charge_special = 0
var quantity_special = 5
var timer_special = 5
var timer_defeat = 3
var nockout = false

var controls = {
	"player_1" : ["up_player_1", "down_player_1", "use_special_player_1"],
	"player_2" : ["up_player_2", "down_player_2", "use_special_player_2"]
}

@onready var sprite_animation = $sprite/AnimationTree

func _ready():
	if player_name == "player_1":
		Global.player_1_life = life
	elif player_name == "player_2":
		Global.player_2_life = life

func _process(_delta):
	sprite_animation["parameters/conditions/get_hit"] = false
	sprite_animation["parameters/conditions/is_special"]= false
	if nockout == false:
		control_animations()
		control_use_special()

func _physics_process(_delta):
	if nockout == false:
		motion_control()
		
func motion_control():
	velocity.y = Global.get_axis(player_name).y * speed
	
	move_and_slide()
	
func control_animations():
	if Input.is_action_pressed(controls[player_name][0]):
		sprite_animation["parameters/conditions/is_moving_up"] = true
		sprite_animation["parameters/conditions/is_moving_down"] = false
		sprite_animation["parameters/conditions/is_idle"] = false
	elif Input.is_action_pressed(controls[player_name][1]):
		sprite_animation["parameters/conditions/is_moving_up"] = false
		sprite_animation["parameters/conditions/is_moving_down"] = true
		sprite_animation["parameters/conditions/is_idle"] = false
	else:
		sprite_animation["parameters/conditions/is_moving_down"] = false
		sprite_animation["parameters/conditions/is_moving_up"] = false
		sprite_animation["parameters/conditions/is_idle"] = true
		
	#Este codigo debe ser pasado al toque de pelota
	if Input.is_action_just_pressed("get_hit_player_1"):
		sprite_animation["parameters/conditions/get_hit"] = true
		Global.get_damage(player_name, 1)
		
		print(Global.player_2_life)
		
		if charge_special == quantity_special:
			Global.get_special(player_name)
		elif charge_special < quantity_special:
			charge_special += 1
				
		if player_name == "player_1":
			if Global.player_1_life == 0:
				Global.player_1_life = life
				nockout = true
				sprite_animation["parameters/conditions/is_nockout"] = nockout
				sprite_animation["parameters/conditions/is_idle"] = false
				$nockout_timer.start(timer_defeat)
				$nockout_particles.emitting = true
		elif player_name == "player_2":
			if Global.player_2_life == 0:
				Global.player_2_life = life
				nockout = true
				sprite_animation["parameters/conditions/is_nockout"] = nockout
				sprite_animation["parameters/conditions/is_idle"] = false
				$nockout_timer.start(timer_defeat)
				$nockout_particles.emitting = true
		
func control_use_special():
	if Input.is_action_just_pressed(controls[player_name][2]):
		if player_name == "player_1":
			if Global.special_player_1:
				Global.special_player_1 = false
				charge_special = 0
				
				print("se ha usado el especial")
				$special_particles.emitting = true
				sprite_animation["parameters/conditions/is_special"]= true
				sprite_animation["parameters/conditions/is_moving_down"] = false
				sprite_animation["parameters/conditions/is_moving_up"] = false
				speed = 800
				$special_timer.start(timer_special)
		elif player_name == "player_2":
			if Global.special_player_2:
				Global.special_player_2 = false
				charge_special = 0
				
				print("se ha usado el especial")
				$special_particles.emitting = true
				sprite_animation["parameters/conditions/is_special"]= true
				sprite_animation["parameters/conditions/is_moving_down"] = false
				sprite_animation["parameters/conditions/is_moving_up"] = false
				speed = 800
				$special_timer.start(timer_special)

func deactive_special():
	speed = 500
	$special_particles.emitting = false

func _on_special_timer_timeout():
	deactive_special()

func deactivate_nockout():
	nockout = false
	sprite_animation["parameters/conditions/is_nockout"] = nockout

func _on_nockout_timer_timeout():
	deactivate_nockout()
	$nockout_particles.emitting = false
