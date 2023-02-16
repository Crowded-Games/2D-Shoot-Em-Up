extends Area2D

@export var player = "Character"

func _on_body_entered(body):
	if body.name == player:
		body.power = true
		self.queue_free()
