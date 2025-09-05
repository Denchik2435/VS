extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
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
