extends Area2D
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	#visible=false
	set_open(false)
	
func _on_timer_3_timeout() -> void:
	#visible=true
	set_open(true)
	pass # Replace with function body.

func set_open(b):
	if b:
		self.modulate=Color(0, 1, 0, 1)
		$CollisionShape2D.disabled=false
	else:
		$CollisionShape2D.disabled=true
