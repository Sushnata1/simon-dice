extends Node2D

func _ready() -> void:
	$VBoxContainer/Score.text = str("Score : "+str(Globals.correct_count))

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://StartScreen.tscn")
