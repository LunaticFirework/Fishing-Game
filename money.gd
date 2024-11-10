extends Control


@onready var label: Label = $CanvasLayer/Label
@onready var stats_manager: Node = %Stats_manager

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	label.text = "Money: " + str(stats_manager.Money)
	
func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x,
		"pos_y" : position.y
	}
	return save_dict
