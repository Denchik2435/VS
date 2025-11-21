extends Node2D


func _on_shop_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/Shop/shopscreen.tscn")
	pass # Replace with function body.


func _on_exit_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.
