extends Area2D

var hp = 100
var coins = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AnimatedSprite2D.play("idle")
	var mouse_coords = get_viewport().get_mouse_position()
	var DX = mouse_coords.x-self.position.x
	var DY = mouse_coords.y-self.position.y
	var stepX = DX/10
	var stepY = DY/10
	self.position.x += stepX
	self.position.y += stepY
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Coins"):
		area.queue_free()
		self.coins+=1
		$Label2.text = "Coins: "+str(coins)
	if area.is_in_group("Enemies"):
		self.hp-=10
		$Label.text = "HP: "+str(self.hp)
		self.modulate=Color(1,0,0,1)
		$Timer.start()

	if hp<=0:
		Globals.total_coins+=self.coins
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	self.modulate=Color(1,1,1,1)

	pass # Replace with function body.
