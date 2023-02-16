extends Area2D

@export var player = "Character"
@onready var absolute_parent = get_parent().get_node(".")

func _on_body_entered(body):
	if body.name == player:
		absolute_parent.Coin += 1
		self.queue_free()
