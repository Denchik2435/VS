extends Area2D

var vx = 100
var vy = 500

var v0 = 450 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		var dx = player.position.x-self.position.x
		var dy = player.position.y-self.position.y
		var D = sqrt(dx*dx+dy*dy)
		var coef = v0/D
		
		if D>0:							#????????
			coef = v0/D
		if D<350:
			vx = dx*coef
			vy = dy*coef
		#self.position.x+=dx/20;
		#self.position.y+=dy/20;
		
	#else: 
		
		self.position.x+=vx*delta
		self.position.y+=vy*delta

		if self.position.x>=get_viewport_rect().size.x:
			vx = - abs(vx)
		if self.position.y>=get_viewport_rect().size.y:
			vy = - abs(vy)
		if self.position.x<=0:
			vx = - abs(vx)
		if self.position.y<=0:
			vy = - abs(vy)
	pass
