extends Area2D

var is_interactable: bool = false
var current_line: int = 0
@onready var label: Label = $Label
@export var lines: Array[String] = [
	"I am fish.",
	"You will need me in your journey.",
	"Whenever you find me, you will find a way to advance to the next world.",
	"Good luck finding me..." ]
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	label.visible = false
	label.text = ""
	current_line = 0
	is_interactable = false
	
func _on_body_entered(body: Node2D) -> void:
		if body.name == "Player":
			is_interactable = true
			$Label.text = "Press Enter to interact" 
			$Label.visible = true
		
func _input(event: InputEvent) -> void:
	# Skip if not interactable or not visible
	if not is_interactable:
		return
	# If “action” is just pressed	
	if Input.is_action_just_pressed("Interact"): # Remember to set up action in Input Map
		# If dialog hasn't started, initialize it
		if current_line == -1:
			current_line = 0
			$Label.text = lines[current_line]
			$Label.visible = true
		# If the line in within the array size, set label to current line in array
		elif current_line < lines.size() -1:
			current_line += 1
			$Label.text = lines[current_line]
		# If reaches the last line, end the dialog
		else:
			$Label.visible = false
			current_line = -1

func _on_body_exited(body: Node2D) -> void:
	# Add player check 
	# if body.name == "Player":
	is_interactable = false
	current_line = -1
	$Label.text = ""
	$Label.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
