extends Node2D

@onready var dice_face

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_button_pressed() -> void:
	$SimonSays.clear()
	$SimonSays.can_check = false
	dice_face = randi_range(1,6)
	print(dice_face)
	$Dice/Label.text = str(dice_face)
	$SimonSays.create(dice_face)
