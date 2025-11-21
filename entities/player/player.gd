extends Area2D

var magnitcoins = []
var magnithp = []
var hp = 100
var coins = 0

var prevx = 0
var prevy = 0 

var dx = prevx-self.position.x
var dy = prevx-self.position.y


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label2.text = "Coins: "+str(coins)
	$Label.text = "HP: "+str(self.hp)
	$Magnitarea/CollisionShape2D2.apply_scale(Vector2(Globals.magnetpover,Globals.magnetpover))
	if Globals.magnetpover == 0:
		$Magnitarea/CollisionShape2D2.disabled = true
	else:
		$Magnitarea/CollisionShape2D2.disabled = false	
	#$AnimatedSprite2D.play("idle")
	prevx = self.position.x
	prevy = self.position.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#$AnimatedSprite2D.play("idle")
	var mouse_coords = get_viewport().get_mouse_position()
	var DX = mouse_coords.x-self.position.x
	var DY = mouse_coords.y-self.position.y
	var stepX = DX/10
	var stepY = DY/10
	
	self.position.x += stepX
	self.position.y += stepY
	
	var d1 = sqrt(stepX*stepX+stepY*stepY)

	if d1 > 1:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
	
	if sign(stepX)!=0:
		$AnimatedSprite2D.scale=Vector2(sign(stepX)*3,3)	
		
	prevx = self.position.x
	prevy = self.position.y
	for i in range(len(magnitcoins)-1,-1,-1):
		var a = magnitcoins[i]
		if a != null:
			var dx = self.position.x-a.position.x
			var dy = self.position.y-a.position.y
			a.position.x+=dx/20
			a.position.y+=dy/20
		else:
			magnitcoins.remove_at(i) 
	
	
	for i in range(len(magnithp)-1,-1,-1):
		var a = magnithp[i]
		if a != null:
			var dx = self.position.x-a.position.x
			var dy = self.position.y-a.position.y
			a.position.x+=dx/20
			a.position.y+=dy/20
		else: 
			magnithp.remove_at(i)
	pass
	

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Coins"):
		area.queue_free()
		self.coins+=1+Globals.lvlmultiplicater
		$Label2.text = "Coins: "+str(coins)
	if area.is_in_group("Enemies"):
		self.hp-=10
		$Label.text = "HP: "+str(self.hp)
		self.modulate=Color(1,0,0,1)
		$Timer.start()
	if area.is_in_group("Potion") and hp<100:
		area.queue_free()
		self.hp+=10
		$Label.text = "HP: "+str(self.hp)

	if hp<=0:
		#self.position.x += stepX
		#self.position.y += stepY
		Globals.total_coins+=self.coins
		get_tree().change_scene_to_file("res://scenes/Game over/menu_screen.tscn")
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	self.modulate=Color(1,1,1,1)

	pass # Replace with function body.


func _on_magnitarea_area_entered(area: Area2D) -> void:
	if area.is_in_group("Coins"):
		print(area)
		magnitcoins.append(area)
	#if area.is_in_group("Potion"):
	#	magnithp.append(area)
	pass # Replace with function body.


func _on_exit_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://scenes/Main/level_2.tscn")
	pass # Replace with function body.
