extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label2.text="Total coins: "+str(Globals.total_coins)
	$Label5.text="Lvl: "+str(Globals.lvlmagnit)
	$Label7.text="lvl: "+str(Globals.lvlmultiplicater)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass # Replace with function body.


func _on_magnit_button_down() -> void:
	if Globals.total_coins >=1 and Globals.lvlmagnit<5:
		Globals.total_coins -=1
		Globals.magnetpover+=0.5
		Globals.lvlmagnit+=1
		$Label5.text="Lvl: "+str(Globals.lvlmagnit)
		$Label2.text="Total coins: "+str(Globals.total_coins)
	pass # Replace with function body.


func _on_button_2_button_down() -> void:
	if Globals.total_coins >=1 and Globals.lvlmultiplicater<3:
		Globals.total_coins -=1
		Globals.lvlmultiplicater +=1
		$Label7.text="lvl: "+str(Globals.lvlmultiplicater)
		$Label2.text="Total coins: "+str(Globals.total_coins)
	pass # Replace with function body.
