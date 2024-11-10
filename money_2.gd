extends Area2D

@onready var stats_manager = %Stats_manager

func _on_body_entered(body: Node2D) -> void:
	stats_manager.add_money()
	print(stats_manager.Money)
	queue_free()
	
