extends Node2D

var ticks = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	ticks+=1
	var c = preload("res://entities/coin/coin.tscn")
	var new_coin = c.instantiate()
	new_coin.position.x = randf_range(0, get_viewport().size.x)
	new_coin.position.y = randf_range(0, get_viewport().size.y)
	add_child(new_coin)
	
	
	var e = preload("res://entities/enemy/skeleton/skeleton.tscn")
	var new_enemy = e.instantiate()
	
	var cx = get_viewport().size.x/2
	var cy = get_viewport().size.y/2
	var r = 0.75*sqrt(get_viewport().size.x**2+get_viewport().size.y**2)
	var phi = randf_range(0,2*PI)
	
	
	new_enemy.position.x=cx+r*sin(phi)
	new_enemy.position.y=cy+r*sin(phi)
	add_child(new_enemy)

	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	randf()
	if randf()<0.5:
		var p =preload("res://entities/potion/potion.tscn")
		var new_potion = p.instantiate()
		new_potion.position.x = randf_range(0, get_viewport().size.x)
		new_potion.position.y = randf_range(0, get_viewport().size.y)
		add_child(new_potion)
	pass # Replace with function body.


func _on_continue_pressed() -> void:
	$Panel.visible=false
	get_tree().paused=$Panel.visible

	pass # Replace with function body.


func _on_timer_3_timeout() -> void:
	pass # Replace with function body.
