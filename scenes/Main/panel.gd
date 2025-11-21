extends Panel

func  _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode==KEY_ESCAPE and event.pressed:
			self.visible=not self.visible
			get_tree().paused=self.visible


func _on_continue_pressed() -> void:
	self.visible=false
	get_tree().paused=self.visible
	pass # Replace with function body.
	
func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
