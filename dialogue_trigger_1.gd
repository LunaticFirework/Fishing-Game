extends Area2D

var is_in_area = false

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@onready var player: CharacterBody2D = %player

func _ready() -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("dialogic_default_action") and is_in_area == true:
		player.speed = 0
		player.JUMP_VELOCITY = 0
		DialogueManager.show_dialogue_balloon(preload("res://dialogues/dialogue_1.dialogue"))

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_in_area = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_in_area = false

func _on_dialogue_ended(_resource: DialogueResource):
		player.speed = 120.0
		player.JUMP_VELOCITY = -300.0
		collision_shape_2d.queue_free()
