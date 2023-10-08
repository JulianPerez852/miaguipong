extends Control

func _ready():
	$animation.play("initiation")
	await $animation.animation_finished

	Global.background_start_sound.play()

	$Sprite2D.show()
	$Sprite2D/anim_logo.play("get_in")
	await $Sprite2D/anim_logo.animation_finished
	
	$color_animated.show()
	$color_animated/anim.play("transition")
	$balls.play()
	await $color_animated/anim.animation_finished
	$color_animated.hide()
	$ColorLogo.show()
	$ReboteLogo.show()
	$ReboteLogo/AnimationPlayer.play("get_bounce")
	
	$start_vs_player.show()
	$start_vs_cpu.show()
	$exit.show()
	

func _on_exit_pressed():
	$select_sound.play()
	await $select_sound.finished
	get_tree().quit()


func _on_start_vs_player_pressed():
	$select_sound.play()
	Global.screen_1 = false
	await $select_sound.finished
	get_tree().change_scene_to_file("res://scenes/ui/screen_select_player.tscn")
