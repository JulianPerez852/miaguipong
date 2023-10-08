extends Line2D

@export var length = 30
@onready var parent = get_parent()

func _ready():
	top_level = true
	clear_points()
	
func _physics_process(delta):
	add_point(parent.global_position)
	
	if points.size() > length:
		remove_point(0)
	
