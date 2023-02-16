extends Node2D

@onready var Background = get_node("Background")

var Score = 0
var Coin = 0

func _process(_delta):
	# This can always be changed.
	Background.get_node("Score").set("text", "Score: " + str(Score) + "\nCoins: " + str(Coin))
