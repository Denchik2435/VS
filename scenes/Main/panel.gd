extends Panel

func  _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode==KEY_ESCAPE and event.pressed:
			self.visible=not self.visible
			get_tree().paused=self.visible
