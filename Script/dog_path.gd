extends PathFollow2D

func kill():
	get_tree().reload_current_scene() # Restart the current scene
@export var speed: float = 500.0
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_mouth_body_entered(body: Node2D) -> void:
	if body.name == "Player":
			kill()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Move the hazard along the path
	progress += speed * delta
	## Move hazard backwards 
	if progress_ratio == 0:
		speed = -speed
	elif progress_ratio == 1.0:
		speed = -speed
